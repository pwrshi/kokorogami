import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokorogami/core/models/osv_vulnerability.dart';

part '../../../../gen/features/project/data/models/package_info.freezed.dart';
part '../../../../gen/features/project/data/models/package_info.g.dart';

@freezed
abstract class PackageInfo with _$PackageInfo {
  const factory PackageInfo({required String name, required String version, List<Vuln>? vulnerabilities}) =
      _PackageInfo;

  factory PackageInfo.fromJson(Map<String, dynamic> json) => _$PackageInfoFromJson(json);
}
