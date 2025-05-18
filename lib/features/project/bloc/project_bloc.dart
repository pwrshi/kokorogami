import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/helpers/pubspec_lock_parser.dart';
import '../../../core/services/vulnerability_service.dart';

import '../data/models/package_info.dart';

part 'project_events.dart';
part 'project_state.dart';
part '../../../gen/features/project/bloc/project_bloc.freezed.dart';

class ProjectBloc extends Bloc<ProjectEvents, ProjectState> {
  final VulnerabilityService _vulnerabilityService;

  ProjectBloc(this._vulnerabilityService) : super(const ProjectState()) {
    on<ProjectEventsOpenProject>((event, emit) {
      emit(state.copyWith(projectPath: event.projectPathDirectory));
    });
    on<ProjectEventsAnalyzePubspec>(_onAnalyzePubspec);
  }

  Future<void> _onAnalyzePubspec(ProjectEventsAnalyzePubspec event, Emitter<ProjectState> emit) async {
    emit(
      state.copyWith(
        pubspecAnalysisStatus: PubspecAnalysisStatus.loading,
        packagesWithVulnerabilities: [], // Use the new field name
        pubspecAnalysisError: null,
      ),
    );
    try {
      final List<PackageInfo> packages = await PubspecLockParser.extractResolvedDependencies(event.projectPath);

      if (packages.isEmpty) {
        emit(
          state.copyWith(
            pubspecAnalysisStatus: PubspecAnalysisStatus.success,
            packagesWithVulnerabilities: [], // Use the new field name
          ),
        );
        return;
      }

      final List<PackageInfo> packagesWithFetchedVulnerabilities = [];
      for (final package in packages) {
        // Skip flutter SDK, its internal packages, and path dependencies for vulnerability scanning
        bool isPathDependency = package.version.contains('/') || package.version.contains('\\'); // Corrected path check
        if (package.name == 'flutter' || package.name == 'sky_engine' || isPathDependency) {
          packagesWithFetchedVulnerabilities.add(package);
          continue;
        }
        try {
          final osvResponse = await _vulnerabilityService.getVulnerabilities(package.name, package.version);
          packagesWithFetchedVulnerabilities.add(package.copyWith(vulnerabilities: osvResponse?.vulns?.toList() ?? []));
        } catch (e) {
          print('Error fetching vulnerabilities for ${package.name} (${package.version}): $e');
          // Add package without vulnerabilities if API call fails for it
          packagesWithFetchedVulnerabilities.add(package.copyWith(vulnerabilities: []));
        }
      }

      emit(
        state.copyWith(
          pubspecAnalysisStatus: PubspecAnalysisStatus.success,
          packagesWithVulnerabilities: packagesWithFetchedVulnerabilities,
        ),
      );
    } catch (e) {
      print('Error in _onAnalyzePubspec: $e');
      emit(state.copyWith(pubspecAnalysisStatus: PubspecAnalysisStatus.failure, pubspecAnalysisError: e.toString()));
    }
  }
}
