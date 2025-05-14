import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/helpers/pubspec_parser.dart';
import '../data/repositories/abstract_cve_repository.dart';
import '../data/models/vulnerable_dependency.dart';

part 'project_events.dart';
part 'project_state.dart';
part '../../../gen/features/project/bloc/project_bloc.freezed.dart';

class ProjectBloc extends Bloc<ProjectEvents, ProjectState> {
  final AbstractCveRepository _cveRepository;

  ProjectBloc(this._cveRepository) : super(const ProjectState()) {
    on<ProjectEventsOpenProject>((event, emit) {
      // Assuming openProject sets the projectPath in the state
      emit(state.copyWith(projectPath: event.projectPathDirectory));
    });
    on<ProjectEventsAnalyzePubspec>(_onAnalyzePubspec);
    // Add other existing event handlers here if any
  }

  Future<void> _onAnalyzePubspec(
    ProjectEventsAnalyzePubspec event,
    Emitter<ProjectState> emit,
  ) async {
    emit(
      state.copyWith(
        pubspecAnalysisStatus: PubspecAnalysisStatus.loading,
        vulnerableDependencies: [],
        pubspecAnalysisError: null,
      ),
    );
    try {
      final packages = await PubspecParser.extractDependencies(
        event.projectPath,
      );
      if (packages.isEmpty) {
        emit(
          state.copyWith(
            pubspecAnalysisStatus: PubspecAnalysisStatus.success,
            vulnerableDependencies: [],
          ),
        );
        return;
      }
      final vulnerabilities = await _cveRepository.checkDependencies(
        projectPath: event.projectPath,
        packages: packages,
      );
      emit(
        state.copyWith(
          pubspecAnalysisStatus: PubspecAnalysisStatus.success,
          vulnerableDependencies: vulnerabilities,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          pubspecAnalysisStatus: PubspecAnalysisStatus.failure,
          pubspecAnalysisError: e.toString(),
        ),
      );
    }
  }
}
