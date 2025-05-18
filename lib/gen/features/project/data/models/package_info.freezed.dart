// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../features/project/data/models/package_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageInfo {

 String get name; String get version; List<Vuln>? get vulnerabilities;
/// Create a copy of PackageInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageInfoCopyWith<PackageInfo> get copyWith => _$PackageInfoCopyWithImpl<PackageInfo>(this as PackageInfo, _$identity);

  /// Serializes this PackageInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.vulnerabilities, vulnerabilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,version,const DeepCollectionEquality().hash(vulnerabilities));

@override
String toString() {
  return 'PackageInfo(name: $name, version: $version, vulnerabilities: $vulnerabilities)';
}


}

/// @nodoc
abstract mixin class $PackageInfoCopyWith<$Res>  {
  factory $PackageInfoCopyWith(PackageInfo value, $Res Function(PackageInfo) _then) = _$PackageInfoCopyWithImpl;
@useResult
$Res call({
 String name, String version, List<Vuln>? vulnerabilities
});




}
/// @nodoc
class _$PackageInfoCopyWithImpl<$Res>
    implements $PackageInfoCopyWith<$Res> {
  _$PackageInfoCopyWithImpl(this._self, this._then);

  final PackageInfo _self;
  final $Res Function(PackageInfo) _then;

/// Create a copy of PackageInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? version = null,Object? vulnerabilities = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,vulnerabilities: freezed == vulnerabilities ? _self.vulnerabilities : vulnerabilities // ignore: cast_nullable_to_non_nullable
as List<Vuln>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PackageInfo implements PackageInfo {
  const _PackageInfo({required this.name, required this.version, final  List<Vuln>? vulnerabilities}): _vulnerabilities = vulnerabilities;
  factory _PackageInfo.fromJson(Map<String, dynamic> json) => _$PackageInfoFromJson(json);

@override final  String name;
@override final  String version;
 final  List<Vuln>? _vulnerabilities;
@override List<Vuln>? get vulnerabilities {
  final value = _vulnerabilities;
  if (value == null) return null;
  if (_vulnerabilities is EqualUnmodifiableListView) return _vulnerabilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PackageInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageInfoCopyWith<_PackageInfo> get copyWith => __$PackageInfoCopyWithImpl<_PackageInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._vulnerabilities, _vulnerabilities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,version,const DeepCollectionEquality().hash(_vulnerabilities));

@override
String toString() {
  return 'PackageInfo(name: $name, version: $version, vulnerabilities: $vulnerabilities)';
}


}

/// @nodoc
abstract mixin class _$PackageInfoCopyWith<$Res> implements $PackageInfoCopyWith<$Res> {
  factory _$PackageInfoCopyWith(_PackageInfo value, $Res Function(_PackageInfo) _then) = __$PackageInfoCopyWithImpl;
@override @useResult
$Res call({
 String name, String version, List<Vuln>? vulnerabilities
});




}
/// @nodoc
class __$PackageInfoCopyWithImpl<$Res>
    implements _$PackageInfoCopyWith<$Res> {
  __$PackageInfoCopyWithImpl(this._self, this._then);

  final _PackageInfo _self;
  final $Res Function(_PackageInfo) _then;

/// Create a copy of PackageInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? version = null,Object? vulnerabilities = freezed,}) {
  return _then(_PackageInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,vulnerabilities: freezed == vulnerabilities ? _self._vulnerabilities : vulnerabilities // ignore: cast_nullable_to_non_nullable
as List<Vuln>?,
  ));
}


}

// dart format on
