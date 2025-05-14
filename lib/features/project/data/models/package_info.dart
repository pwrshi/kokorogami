import 'package:freezed_annotation/freezed_annotation.dart';
part '../../../../gen/features/project/data/models/package_info.freezed.dart';

@freezed
abstract class PackageInfo with _$PackageInfo {
  const factory PackageInfo({required String name, required String version}) =
      _PackageInfo;
}
