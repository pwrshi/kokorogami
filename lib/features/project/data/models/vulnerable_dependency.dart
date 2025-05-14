import 'package:freezed_annotation/freezed_annotation.dart';
part '../../../../gen/features/project/data/models/vulnerable_dependency.freezed.dart';

@freezed
abstract class VulnerableDependency with _$VulnerableDependency {
  const factory VulnerableDependency({
    required String packageName,
    required String installedVersion,
    required String cveId,
    required String description,
    required String severity,
    String? affectedVersions,
    String? fixVersion,
  }) = _VulnerableDependency;
}
