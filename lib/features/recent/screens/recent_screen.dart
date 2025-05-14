import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:kokorogami/core/helpers/project_helpers.dart';
import 'package:kokorogami/entrypoint/di.dart';
import 'package:kokorogami/entrypoint/routes.gr.dart';
import 'package:kokorogami/gen/assets.gen.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:window_manager/window_manager.dart';

@RoutePage()
class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  @override
  void initState() {
    super.initState();
    _configureWindow();
  }

  Future<void> _configureWindow() async {
    await windowManager.waitUntilReadyToShow();
    await windowManager.setSize(const Size(540, 300));
    await windowManager.setResizable(false);
    await windowManager.center();
    await windowManager.show();
  }

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: Sidebar(
        windowBreakpoint: 0,
        isResizable: false,
        builder: (context, scrollController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _AppInfo(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PushButton(
                      controlSize: ControlSize.large,
                      onPressed: () async {
                        final router = context.router;
                        final directoryPath =
                            await di.get<FilePicker>().getDirectoryPath();
                        if (directoryPath != null) {
                          final isValid =
                              await ProjectHelpers.pubspecIsValidInDirectory(
                                directoryPath,
                              );
                          if (isValid) {
                            router.push(
                              ProjectNavigationWrapperRoute(
                                folderPath: directoryPath,
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('Open Project Folder'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        minWidth: 300,
        startWidth: 300,
        maxWidth: 300,
      ),
      child: const _RecentProjectsList(),
    );
  }
}

class _AppInfo extends StatelessWidget {
  const _AppInfo();

  @override
  Widget build(BuildContext context) {
    final appInfo = di.get<PackageInfo>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(Assets.images.appIcon.path, width: 120, height: 120),
        Column(
          children: [
            Text('Kokorogami', style: MacosTypography.of(context).largeTitle),
            Text(
              'version: ${appInfo.version} (${appInfo.buildNumber})',
              style: MacosTypography.of(context).subheadline,
            ),
          ],
        ),
      ],
    );
  }
}

class _RecentProjectsList extends StatelessWidget {
  const _RecentProjectsList();

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual recent project data
    final recentProjects = [
      _RecentProjectViewModel(
        name: 'multitimer_flutter',
        path: '~/work/mulitimer_flutter',
        status: _ProjectStatus.success,
      ),
      _RecentProjectViewModel(
        name: 'tmk_unit_flutter',
        path: '~/work/tmk/tmk_unit_flutter',
        status: _ProjectStatus.warning,
      ),
      _RecentProjectViewModel(
        name: 'another_project',
        path: '~/dev/another_project',
        status: _ProjectStatus.error,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              spacing: 10,
              children:
                  recentProjects
                      .map((project) => _RecentProjectTile(project: project))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

enum _ProjectStatus { success, warning, error }

class _RecentProjectViewModel {
  final String name;
  final String path;
  final _ProjectStatus status;

  _RecentProjectViewModel({
    required this.name,
    required this.path,
    required this.status,
  });
}

class _RecentProjectTile extends StatelessWidget {
  final _RecentProjectViewModel project;

  const _RecentProjectTile({required this.project});

  IconData get _statusIcon {
    switch (project.status) {
      case _ProjectStatus.success:
        return CupertinoIcons.checkmark_shield;
      case _ProjectStatus.warning:
        return CupertinoIcons.exclamationmark_shield;
      case _ProjectStatus.error:
        return CupertinoIcons.xmark_shield;
    }
  }

  Color get _statusColor {
    switch (project.status) {
      case _ProjectStatus.success:
        return MacosColors.appleGreen;
      case _ProjectStatus.warning:
        return MacosColors.appleOrange;
      case _ProjectStatus.error:
        return MacosColors.appleRed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MacosListTile(
      onClick: () {
        // TODO: Implement opening the project
      },
      title: Text(project.name),
      subtitle: Text(
        project.path,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: MacosIcon(_statusIcon, size: 22, color: _statusColor),
    );
  }
}
