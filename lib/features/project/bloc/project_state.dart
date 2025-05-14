part of 'project_bloc.dart';

// The import for VulnerableDependency will be moved to project_bloc.dart

enum PubspecAnalysisStatus { initial, loading, success, failure }

@freezed
abstract class ProjectState with _$ProjectState {
  const factory ProjectState({
    // Existing fields (assuming they are or will be part of the state)
    @Default('') String projectPath,
    @Default(false) bool isSadtScanning, // Example existing field
    // New fields for pubspec analysis
    @Default(PubspecAnalysisStatus.initial)
    PubspecAnalysisStatus pubspecAnalysisStatus,
    @Default([]) List<VulnerableDependency> vulnerableDependencies,
    String? pubspecAnalysisError,
  }) = _ProjectState;
}
