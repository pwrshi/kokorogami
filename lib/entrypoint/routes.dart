import 'package:auto_route/auto_route.dart';
import 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: RecentRoute.page),
    AutoRoute(
      page: ProjectNavigationWrapperRoute.page,
      path: '/project/:folderPath',
      children: [
        AutoRoute(page: ProjectOverviewRoute.page, path: ''),
        // Updated path to include projectPath as a dynamic segment
        AutoRoute(
          page: ProjectPubspecAnalysisRoute.page,
          path: 'pubspec/:projectPath',
        ),
        AutoRoute(page: ProjectSastRoute.page, path: 'sast'),
      ],
    ),
  ];
}
