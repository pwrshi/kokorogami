import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kokorogami/entrypoint/di.dart';
import 'package:kokorogami/entrypoint/routes.gr.dart';
import 'package:kokorogami/features/project/bloc/project_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_manager/window_manager.dart';

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
    return PlatformMenuBar(
      menus: const [
        PlatformMenu(
          label: 'Kokorogami',
          menus: [
            PlatformProvidedMenuItem(type: PlatformProvidedMenuItemType.about),
            PlatformProvidedMenuItem(type: PlatformProvidedMenuItemType.quit),
          ],
        ),
      ],
      child: AutoTabsRouter.tabBar(
        animatePageTransition: false,
        routes: [
          ProjectOverviewRoute(),
          ProjectPubspecAnalysisRoute(projectPath: widget.folderPath),
          ProjectSadtRoute(),
        ],
        builder: (context, child, tabController) {
          return MacosWindow(
            sidebar: Sidebar(
              minWidth: 200,
              builder:
                  (context, scrollController) => SidebarItems(
                    currentIndex: tabController.index,
                    onChanged: (index) {
                      tabController.animateTo(index);
                    },
                    items: const [
                      SidebarItem(
                        leading: MacosIcon(CupertinoIcons.home),
                        label: Text('Overview'),
                      ),
                      SidebarItem(
                        leading: MacosIcon(CupertinoIcons.hare),
                        label: Text('Pubspec analysis'),
                      ),
                      SidebarItem(
                        leading: MacosIcon(CupertinoIcons.ant),
                        label: Text('SADT analysis'),
                      ),
                    ],
                  ),
            ),
            child: child,
          );
        },
      ),
    );
  }
}
