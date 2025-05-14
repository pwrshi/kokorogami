// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:kokorogami/features/project/screens/project_navigation_wrapper_screen.dart'
    as _i1;
import 'package:kokorogami/features/project/screens/project_overview_screen.dart'
    as _i2;
import 'package:kokorogami/features/project/screens/project_pubspec_analysis_screen.dart'
    as _i3;
import 'package:kokorogami/features/project/screens/project_sadt_screen.dart'
    as _i4;
import 'package:kokorogami/features/recent/screens/recent_screen.dart' as _i5;

/// generated route for
/// [_i1.ProjectNavigationWrapperScreen]
class ProjectNavigationWrapperRoute
    extends _i6.PageRouteInfo<ProjectNavigationWrapperRouteArgs> {
  ProjectNavigationWrapperRoute({
    _i7.Key? key,
    required String folderPath,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         ProjectNavigationWrapperRoute.name,
         args: ProjectNavigationWrapperRouteArgs(
           key: key,
           folderPath: folderPath,
         ),
         rawPathParams: {'folderPath': folderPath},
         initialChildren: children,
       );

  static const String name = 'ProjectNavigationWrapperRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProjectNavigationWrapperRouteArgs>(
        orElse:
            () => ProjectNavigationWrapperRouteArgs(
              folderPath: pathParams.getString('folderPath'),
            ),
      );
      return _i6.WrappedRoute(
        child: _i1.ProjectNavigationWrapperScreen(
          key: args.key,
          folderPath: args.folderPath,
        ),
      );
    },
  );
}

class ProjectNavigationWrapperRouteArgs {
  const ProjectNavigationWrapperRouteArgs({this.key, required this.folderPath});

  final _i7.Key? key;

  final String folderPath;

  @override
  String toString() {
    return 'ProjectNavigationWrapperRouteArgs{key: $key, folderPath: $folderPath}';
  }
}

/// generated route for
/// [_i2.ProjectOverviewScreen]
class ProjectOverviewRoute extends _i6.PageRouteInfo<void> {
  const ProjectOverviewRoute({List<_i6.PageRouteInfo>? children})
    : super(ProjectOverviewRoute.name, initialChildren: children);

  static const String name = 'ProjectOverviewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.ProjectOverviewScreen();
    },
  );
}

/// generated route for
/// [_i3.ProjectPubspecAnalysisScreen]
class ProjectPubspecAnalysisRoute
    extends _i6.PageRouteInfo<ProjectPubspecAnalysisRouteArgs> {
  ProjectPubspecAnalysisRoute({
    _i7.Key? key,
    required String projectPath,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         ProjectPubspecAnalysisRoute.name,
         args: ProjectPubspecAnalysisRouteArgs(
           key: key,
           projectPath: projectPath,
         ),
         initialChildren: children,
       );

  static const String name = 'ProjectPubspecAnalysisRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectPubspecAnalysisRouteArgs>();
      return _i3.ProjectPubspecAnalysisScreen(
        key: args.key,
        projectPath: args.projectPath,
      );
    },
  );
}

class ProjectPubspecAnalysisRouteArgs {
  const ProjectPubspecAnalysisRouteArgs({this.key, required this.projectPath});

  final _i7.Key? key;

  final String projectPath;

  @override
  String toString() {
    return 'ProjectPubspecAnalysisRouteArgs{key: $key, projectPath: $projectPath}';
  }
}

/// generated route for
/// [_i4.ProjectSadtScreen]
class ProjectSadtRoute extends _i6.PageRouteInfo<void> {
  const ProjectSadtRoute({List<_i6.PageRouteInfo>? children})
    : super(ProjectSadtRoute.name, initialChildren: children);

  static const String name = 'ProjectSadtRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProjectSadtScreen();
    },
  );
}

/// generated route for
/// [_i5.RecentScreen]
class RecentRoute extends _i6.PageRouteInfo<void> {
  const RecentRoute({List<_i6.PageRouteInfo>? children})
    : super(RecentRoute.name, initialChildren: children);

  static const String name = 'RecentRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.RecentScreen();
    },
  );
}
