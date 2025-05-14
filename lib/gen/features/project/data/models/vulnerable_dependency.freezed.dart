// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../features/project/data/models/vulnerable_dependency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VulnerableDependency {

 String get packageName; String get installedVersion; String get cveId; String get description; String get severity; String? get affectedVersions; String? get fixVersion;
/// Create a copy of VulnerableDependency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VulnerableDependencyCopyWith<VulnerableDependency> get copyWith => _$VulnerableDependencyCopyWithImpl<VulnerableDependency>(this as VulnerableDependency, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VulnerableDependency&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.installedVersion, installedVersion) || other.installedVersion == installedVersion)&&(identical(other.cveId, cveId) || other.cveId == cveId)&&(identical(other.description, description) || other.description == description)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.affectedVersions, affectedVersions) || other.affectedVersions == affectedVersions)&&(identical(other.fixVersion, fixVersion) || other.fixVersion == fixVersion));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,installedVersion,cveId,description,severity,affectedVersions,fixVersion);

@override
String toString() {
  return 'VulnerableDependency(packageName: $packageName, installedVersion: $installedVersion, cveId: $cveId, description: $description, severity: $severity, affectedVersions: $affectedVersions, fixVersion: $fixVersion)';
}


}

/// @nodoc
abstract mixin class $VulnerableDependencyCopyWith<$Res>  {
  factory $VulnerableDependencyCopyWith(VulnerableDependency value, $Res Function(VulnerableDependency) _then) = _$VulnerableDependencyCopyWithImpl;
@useResult
$Res call({
 String packageName, String installedVersion, String cveId, String description, String severity, String? affectedVersions, String? fixVersion
});




}
/// @nodoc
class _$VulnerableDependencyCopyWithImpl<$Res>
    implements $VulnerableDependencyCopyWith<$Res> {
  _$VulnerableDependencyCopyWithImpl(this._self, this._then);

  final VulnerableDependency _self;
  final $Res Function(VulnerableDependency) _then;

/// Create a copy of VulnerableDependency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? installedVersion = null,Object? cveId = null,Object? description = null,Object? severity = null,Object? affectedVersions = freezed,Object? fixVersion = freezed,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,installedVersion: null == installedVersion ? _self.installedVersion : installedVersion // ignore: cast_nullable_to_non_nullable
as String,cveId: null == cveId ? _self.cveId : cveId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,affectedVersions: freezed == affectedVersions ? _self.affectedVersions : affectedVersions // ignore: cast_nullable_to_non_nullable
as String?,fixVersion: freezed == fixVersion ? _self.fixVersion : fixVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _VulnerableDependency implements VulnerableDependency {
  const _VulnerableDependency({required this.packageName, required this.installedVersion, required this.cveId, required this.description, required this.severity, this.affectedVersions, this.fixVersion});
  

@override final  String packageName;
@override final  String installedVersion;
@override final  String cveId;
@override final  String description;
@override final  String severity;
@override final  String? affectedVersions;
@override final  String? fixVersion;

/// Create a copy of VulnerableDependency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VulnerableDependencyCopyWith<_VulnerableDependency> get copyWith => __$VulnerableDependencyCopyWithImpl<_VulnerableDependency>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VulnerableDependency&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.installedVersion, installedVersion) || other.installedVersion == installedVersion)&&(identical(other.cveId, cveId) || other.cveId == cveId)&&(identical(other.description, description) || other.description == description)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.affectedVersions, affectedVersions) || other.affectedVersions == affectedVersions)&&(identical(other.fixVersion, fixVersion) || other.fixVersion == fixVersion));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,installedVersion,cveId,description,severity,affectedVersions,fixVersion);

@override
String toString() {
  return 'VulnerableDependency(packageName: $packageName, installedVersion: $installedVersion, cveId: $cveId, description: $description, severity: $severity, affectedVersions: $affectedVersions, fixVersion: $fixVersion)';
}


}

/// @nodoc
abstract mixin class _$VulnerableDependencyCopyWith<$Res> implements $VulnerableDependencyCopyWith<$Res> {
  factory _$VulnerableDependencyCopyWith(_VulnerableDependency value, $Res Function(_VulnerableDependency) _then) = __$VulnerableDependencyCopyWithImpl;
@override @useResult
$Res call({
 String packageName, String installedVersion, String cveId, String description, String severity, String? affectedVersions, String? fixVersion
});




}
/// @nodoc
class __$VulnerableDependencyCopyWithImpl<$Res>
    implements _$VulnerableDependencyCopyWith<$Res> {
  __$VulnerableDependencyCopyWithImpl(this._self, this._then);

  final _VulnerableDependency _self;
  final $Res Function(_VulnerableDependency) _then;

/// Create a copy of VulnerableDependency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? installedVersion = null,Object? cveId = null,Object? description = null,Object? severity = null,Object? affectedVersions = freezed,Object? fixVersion = freezed,}) {
  return _then(_VulnerableDependency(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,installedVersion: null == installedVersion ? _self.installedVersion : installedVersion // ignore: cast_nullable_to_non_nullable
as String,cveId: null == cveId ? _self.cveId : cveId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,affectedVersions: freezed == affectedVersions ? _self.affectedVersions : affectedVersions // ignore: cast_nullable_to_non_nullable
as String?,fixVersion: freezed == fixVersion ? _self.fixVersion : fixVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
