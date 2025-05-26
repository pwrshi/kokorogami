import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kokorogami/entrypoint/di.dart';
import 'package:kokorogami/entrypoint/routes.gr.dart';
import 'package:kokorogami/features/project/bloc/project_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:io' show Platform;
import 'package:yaru/yaru.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProjectNavigationWrapperScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const ProjectNavigationWrapperScreen({
    super.key,
    @PathParam('folderPath') required this.folderPath,
  });

  final String folderPath;

  @override
  State<ProjectNavigationWrapperScreen> createState() =>
      _ProjectNavigationWrapperScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProjectBloc>(
      create: (context) => ProjectBloc(di()),
      child: this,
    );
  }
}

class _ProjectNavigationWrapperScreenState
    extends State<ProjectNavigationWrapperScreen> {
  @override
  void initState() {
    super.initState();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setSize(const Size(800, 600));
      await windowManager.setResizable(true);
      await windowManager.center();
      await windowManager.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    final navItems = [
      (
        title: 'Overview',
        ubuntuIcon: YaruIcons.home,
        macosIcon: CupertinoIcons.home,
      ),
      (
        title: 'Pubspec analysis',
        ubuntuIcon: YaruIcons.search,
        macosIcon: CupertinoIcons.hare,
      ),
      (
        title: 'SADT analysis',
        ubuntuIcon: YaruIcons.settings,
        macosIcon: CupertinoIcons.ant,
      ),
    ];

    final List<PageRouteInfo<dynamic>> routes = [
      ProjectOverviewRoute(),
      ProjectPubspecAnalysisRoute(projectPath: widget.folderPath),
      ProjectSastRoute(),
    ];

    return AutoTabsRouter.tabBar(
      animatePageTransition: false,
      routes: routes,
      builder: (context, child, tabController) {
        return switch (Platform.operatingSystem) {
          'macos' => PlatformMenuBar(
            menus: const [],
            child: MacosWindow(
              sidebar: Sidebar(
                minWidth: 200,
                builder:
                    (context, scrollController) => SidebarItems(
                      currentIndex: tabController.index,
                      onChanged: (index) {
                        tabController.animateTo(index);
                      },
                      items:
                          navItems
                              .map(
                                (item) => SidebarItem(
                                  leading: MacosIcon(item.macosIcon),
                                  label: Text(item.title),
                                ),
                              )
                              .toList(),
                    ),
              ),
              child: child,
            ),
          ),
          _ => Scaffold(
            body: YaruMasterDetailPage(
              length: navItems.length,
              appBar: const YaruWindowTitleBar(),
              tileBuilder: (context, index, selected, availableWidth) {
                final item = navItems[index];
                return YaruMasterTile(
                  leading: Icon(item.ubuntuIcon),
                  title: Text(item.title),
                  selected: tabController.index == index,
                  onTap: () {
                    tabController.animateTo(index);
                  },
                );
              },
              pageBuilder: (context, index) {
                return child;
              },
            ),
          ),
        };
      },
    );
  }
}
