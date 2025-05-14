// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../features/project/bloc/project_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvents()';
}


}

/// @nodoc
class $ProjectEventsCopyWith<$Res>  {
$ProjectEventsCopyWith(ProjectEvents _, $Res Function(ProjectEvents) __);
}


/// @nodoc


class ProjectEventsOpenProject implements ProjectEvents {
  const ProjectEventsOpenProject({required this.projectPathDirectory});
  

 final  String projectPathDirectory;

/// Create a copy of ProjectEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectEventsOpenProjectCopyWith<ProjectEventsOpenProject> get copyWith => _$ProjectEventsOpenProjectCopyWithImpl<ProjectEventsOpenProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEventsOpenProject&&(identical(other.projectPathDirectory, projectPathDirectory) || other.projectPathDirectory == projectPathDirectory));
}


@override
int get hashCode => Object.hash(runtimeType,projectPathDirectory);

@override
String toString() {
  return 'ProjectEvents.openProject(projectPathDirectory: $projectPathDirectory)';
}


}

/// @nodoc
abstract mixin class $ProjectEventsOpenProjectCopyWith<$Res> implements $ProjectEventsCopyWith<$Res> {
  factory $ProjectEventsOpenProjectCopyWith(ProjectEventsOpenProject value, $Res Function(ProjectEventsOpenProject) _then) = _$ProjectEventsOpenProjectCopyWithImpl;
@useResult
$Res call({
 String projectPathDirectory
});




}
/// @nodoc
class _$ProjectEventsOpenProjectCopyWithImpl<$Res>
    implements $ProjectEventsOpenProjectCopyWith<$Res> {
  _$ProjectEventsOpenProjectCopyWithImpl(this._self, this._then);

  final ProjectEventsOpenProject _self;
  final $Res Function(ProjectEventsOpenProject) _then;

/// Create a copy of ProjectEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectPathDirectory = null,}) {
  return _then(ProjectEventsOpenProject(
projectPathDirectory: null == projectPathDirectory ? _self.projectPathDirectory : projectPathDirectory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectEventsRefresh implements ProjectEvents {
  const ProjectEventsRefresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEventsRefresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvents.refresh()';
}


}




/// @nodoc


class ProjectEventsStartScanning implements ProjectEvents {
  const ProjectEventsStartScanning();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEventsStartScanning);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvents.startScaning()';
}


}




/// @nodoc


class ProjectEventsStopScanning implements ProjectEvents {
  const ProjectEventsStopScanning();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEventsStopScanning);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvents.stopScanning()';
}


}




/// @nodoc


class ProjectEventsAnalyzePubspec implements ProjectEvents {
  const ProjectEventsAnalyzePubspec({required this.projectPath});
  

 final  String projectPath;

/// Create a copy of ProjectEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectEventsAnalyzePubspecCopyWith<ProjectEventsAnalyzePubspec> get copyWith => _$ProjectEventsAnalyzePubspecCopyWithImpl<ProjectEventsAnalyzePubspec>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEventsAnalyzePubspec&&(identical(other.projectPath, projectPath) || other.projectPath == projectPath));
}


@override
int get hashCode => Object.hash(runtimeType,projectPath);

@override
String toString() {
  return 'ProjectEvents.analyzePubspec(projectPath: $projectPath)';
}


}

/// @nodoc
abstract mixin class $ProjectEventsAnalyzePubspecCopyWith<$Res> implements $ProjectEventsCopyWith<$Res> {
  factory $ProjectEventsAnalyzePubspecCopyWith(ProjectEventsAnalyzePubspec value, $Res Function(ProjectEventsAnalyzePubspec) _then) = _$ProjectEventsAnalyzePubspecCopyWithImpl;
@useResult
$Res call({
 String projectPath
});




}
/// @nodoc
class _$ProjectEventsAnalyzePubspecCopyWithImpl<$Res>
    implements $ProjectEventsAnalyzePubspecCopyWith<$Res> {
  _$ProjectEventsAnalyzePubspecCopyWithImpl(this._self, this._then);

  final ProjectEventsAnalyzePubspec _self;
  final $Res Function(ProjectEventsAnalyzePubspec) _then;

/// Create a copy of ProjectEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectPath = null,}) {
  return _then(ProjectEventsAnalyzePubspec(
projectPath: null == projectPath ? _self.projectPath : projectPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ProjectState {

// Existing fields (assuming they are or will be part of the state)
 String get projectPath; bool get isSadtScanning;// Example existing field
// New fields for pubspec analysis
 PubspecAnalysisStatus get pubspecAnalysisStatus; List<VulnerableDependency> get vulnerableDependencies; String? get pubspecAnalysisError;
/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStateCopyWith<ProjectState> get copyWith => _$ProjectStateCopyWithImpl<ProjectState>(this as ProjectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectState&&(identical(other.projectPath, projectPath) || other.projectPath == projectPath)&&(identical(other.isSadtScanning, isSadtScanning) || other.isSadtScanning == isSadtScanning)&&(identical(other.pubspecAnalysisStatus, pubspecAnalysisStatus) || other.pubspecAnalysisStatus == pubspecAnalysisStatus)&&const DeepCollectionEquality().equals(other.vulnerableDependencies, vulnerableDependencies)&&(identical(other.pubspecAnalysisError, pubspecAnalysisError) || other.pubspecAnalysisError == pubspecAnalysisError));
}


@override
int get hashCode => Object.hash(runtimeType,projectPath,isSadtScanning,pubspecAnalysisStatus,const DeepCollectionEquality().hash(vulnerableDependencies),pubspecAnalysisError);

@override
String toString() {
  return 'ProjectState(projectPath: $projectPath, isSadtScanning: $isSadtScanning, pubspecAnalysisStatus: $pubspecAnalysisStatus, vulnerableDependencies: $vulnerableDependencies, pubspecAnalysisError: $pubspecAnalysisError)';
}


}

/// @nodoc
abstract mixin class $ProjectStateCopyWith<$Res>  {
  factory $ProjectStateCopyWith(ProjectState value, $Res Function(ProjectState) _then) = _$ProjectStateCopyWithImpl;
@useResult
$Res call({
 String projectPath, bool isSadtScanning, PubspecAnalysisStatus pubspecAnalysisStatus, List<VulnerableDependency> vulnerableDependencies, String? pubspecAnalysisError
});




}
/// @nodoc
class _$ProjectStateCopyWithImpl<$Res>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._self, this._then);

  final ProjectState _self;
  final $Res Function(ProjectState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectPath = null,Object? isSadtScanning = null,Object? pubspecAnalysisStatus = null,Object? vulnerableDependencies = null,Object? pubspecAnalysisError = freezed,}) {
  return _then(_self.copyWith(
projectPath: null == projectPath ? _self.projectPath : projectPath // ignore: cast_nullable_to_non_nullable
as String,isSadtScanning: null == isSadtScanning ? _self.isSadtScanning : isSadtScanning // ignore: cast_nullable_to_non_nullable
as bool,pubspecAnalysisStatus: null == pubspecAnalysisStatus ? _self.pubspecAnalysisStatus : pubspecAnalysisStatus // ignore: cast_nullable_to_non_nullable
as PubspecAnalysisStatus,vulnerableDependencies: null == vulnerableDependencies ? _self.vulnerableDependencies : vulnerableDependencies // ignore: cast_nullable_to_non_nullable
as List<VulnerableDependency>,pubspecAnalysisError: freezed == pubspecAnalysisError ? _self.pubspecAnalysisError : pubspecAnalysisError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _ProjectState implements ProjectState {
  const _ProjectState({this.projectPath = '', this.isSadtScanning = false, this.pubspecAnalysisStatus = PubspecAnalysisStatus.initial, final  List<VulnerableDependency> vulnerableDependencies = const [], this.pubspecAnalysisError}): _vulnerableDependencies = vulnerableDependencies;
  

// Existing fields (assuming they are or will be part of the state)
@override@JsonKey() final  String projectPath;
@override@JsonKey() final  bool isSadtScanning;
// Example existing field
// New fields for pubspec analysis
@override@JsonKey() final  PubspecAnalysisStatus pubspecAnalysisStatus;
 final  List<VulnerableDependency> _vulnerableDependencies;
@override@JsonKey() List<VulnerableDependency> get vulnerableDependencies {
  if (_vulnerableDependencies is EqualUnmodifiableListView) return _vulnerableDependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vulnerableDependencies);
}

@override final  String? pubspecAnalysisError;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectStateCopyWith<_ProjectState> get copyWith => __$ProjectStateCopyWithImpl<_ProjectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectState&&(identical(other.projectPath, projectPath) || other.projectPath == projectPath)&&(identical(other.isSadtScanning, isSadtScanning) || other.isSadtScanning == isSadtScanning)&&(identical(other.pubspecAnalysisStatus, pubspecAnalysisStatus) || other.pubspecAnalysisStatus == pubspecAnalysisStatus)&&const DeepCollectionEquality().equals(other._vulnerableDependencies, _vulnerableDependencies)&&(identical(other.pubspecAnalysisError, pubspecAnalysisError) || other.pubspecAnalysisError == pubspecAnalysisError));
}


@override
int get hashCode => Object.hash(runtimeType,projectPath,isSadtScanning,pubspecAnalysisStatus,const DeepCollectionEquality().hash(_vulnerableDependencies),pubspecAnalysisError);

@override
String toString() {
  return 'ProjectState(projectPath: $projectPath, isSadtScanning: $isSadtScanning, pubspecAnalysisStatus: $pubspecAnalysisStatus, vulnerableDependencies: $vulnerableDependencies, pubspecAnalysisError: $pubspecAnalysisError)';
}


}

/// @nodoc
abstract mixin class _$ProjectStateCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory _$ProjectStateCopyWith(_ProjectState value, $Res Function(_ProjectState) _then) = __$ProjectStateCopyWithImpl;
@override @useResult
$Res call({
 String projectPath, bool isSadtScanning, PubspecAnalysisStatus pubspecAnalysisStatus, List<VulnerableDependency> vulnerableDependencies, String? pubspecAnalysisError
});




}
/// @nodoc
class __$ProjectStateCopyWithImpl<$Res>
    implements _$ProjectStateCopyWith<$Res> {
  __$ProjectStateCopyWithImpl(this._self, this._then);

  final _ProjectState _self;
  final $Res Function(_ProjectState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectPath = null,Object? isSadtScanning = null,Object? pubspecAnalysisStatus = null,Object? vulnerableDependencies = null,Object? pubspecAnalysisError = freezed,}) {
  return _then(_ProjectState(
projectPath: null == projectPath ? _self.projectPath : projectPath // ignore: cast_nullable_to_non_nullable
as String,isSadtScanning: null == isSadtScanning ? _self.isSadtScanning : isSadtScanning // ignore: cast_nullable_to_non_nullable
as bool,pubspecAnalysisStatus: null == pubspecAnalysisStatus ? _self.pubspecAnalysisStatus : pubspecAnalysisStatus // ignore: cast_nullable_to_non_nullable
as PubspecAnalysisStatus,vulnerableDependencies: null == vulnerableDependencies ? _self._vulnerableDependencies : vulnerableDependencies // ignore: cast_nullable_to_non_nullable
as List<VulnerableDependency>,pubspecAnalysisError: freezed == pubspecAnalysisError ? _self.pubspecAnalysisError : pubspecAnalysisError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
