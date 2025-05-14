part of 'project_bloc.dart';

@freezed
abstract class ProjectEvents with _$ProjectEvents {
  const factory ProjectEvents.openProject({
    required String projectPathDirectory,
  }) = ProjectEventsOpenProject;
  const factory ProjectEvents.refresh() = ProjectEventsRefresh;
  const factory ProjectEvents.startScaning() = ProjectEventsStartScanning;
  const factory ProjectEvents.stopScanning() = ProjectEventsStopScanning;

  // New event for pubspec analysis
  const factory ProjectEvents.analyzePubspec({required String projectPath}) =
      ProjectEventsAnalyzePubspec;
}
