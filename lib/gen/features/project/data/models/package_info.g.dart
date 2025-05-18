// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../features/project/data/models/package_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageInfo _$PackageInfoFromJson(Map<String, dynamic> json) => _PackageInfo(
  name: json['name'] as String,
  version: json['version'] as String,
  vulnerabilities:
      (json['vulnerabilities'] as List<dynamic>?)
          ?.map((e) => Vuln.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PackageInfoToJson(_PackageInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'vulnerabilities': instance.vulnerabilities,
    };
