import 'dart:io' show Platform;

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kokorogami/core/helpers/project_helpers.dart';
import 'package:kokorogami/entrypoint/di.dart';
import 'package:kokorogami/entrypoint/routes.gr.dart';
import 'package:kokorogami/gen/assets.gen.dart';
import 'package:macos_ui/macos_ui.dart' as macos_ui;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru/yaru.dart';

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
    if (Platform.isMacOS) {
      await windowManager.setSize(const Size(540, 300));
    } else {
      await windowManager.setSize(const Size(600, 450));
    }
    await windowManager.setResizable(true);
    await windowManager.center();
    await windowManager.show();
  }

  Future<void> _openProjectFolder() async {
    final router = context.router;
    final directoryPath = await di.get<FilePicker>().getDirectoryPath();
    if (directoryPath != null) {
      final isValid = await ProjectHelpers.pubspecIsValidInDirectory(directoryPath);
      if (isValid) {
        router.push(ProjectNavigationWrapperRoute(folderPath: directoryPath));
      } else {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Selected folder is not a valid Flutter project.")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS) {
      return macos_ui.MacosWindow(
        sidebar: macos_ui.Sidebar(
          windowBreakpoint: 0,
          isResizable: false,
          builder: (context, scrollController) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _AppInfoMacos(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      macos_ui.PushButton(
                        controlSize: macos_ui.ControlSize.large,
                        onPressed: _openProjectFolder,
                        child: const Text('Open Project Folder'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          minWidth: 220,
          startWidth: 220,
          maxWidth: 220,
        ),
        child: const _RecentProjectsListMacos(),
      );
    } else {
      final appInfoPane = Container(
        color: Theme.of(context).colorScheme.surfaceVariant,
        padding: const EdgeInsets.all(kYaruPagePadding),
        alignment: Alignment.center,
        child: const _AppInfoYaru(),
      );

      return Scaffold(
        appBar: YaruWindowTitleBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: YaruOptionButton(onPressed: _openProjectFolder, child: const Icon(YaruIcons.folder)),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: YaruPanedView(
                pane: appInfoPane,
                page: _RecentProjectsListYaru(),
                layoutDelegate: const YaruResizablePaneDelegate(
                  initialPaneSize: 160,
                  minPaneSize: 120,
                  minPageSize: 200,
                  paneSide: YaruPaneSide.top,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _AppInfoMacos extends StatelessWidget {
  const _AppInfoMacos();

  @override
  Widget build(BuildContext context) {
    final appInfo = di.get<PackageInfo>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(Assets.images.appIcon.path, width: 100, height: 100),
        const SizedBox(height: 8),
        Text('Kokorogami', style: macos_ui.MacosTypography.of(context).largeTitle.copyWith(fontSize: 18)),
        Text(
          'v${appInfo.version} (${appInfo.buildNumber})',
          style: macos_ui.MacosTypography.of(context).subheadline.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}

class _AppInfoYaru extends StatelessWidget {
  const _AppInfoYaru();

  @override
  Widget build(BuildContext context) {
    final appInfo = di.get<PackageInfo>();
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.images.appIcon.path, width: 60, height: 60),
        const SizedBox(height: 8),
        Text('Kokorogami', style: textTheme.titleLarge),
        Text('v${appInfo.version} (${appInfo.buildNumber})', style: textTheme.bodyMedium),
      ],
    );
  }
}

enum _ProjectStatus { success, warning, error }

class _RecentProjectViewModel {
  final String name;
  final String path;
  final _ProjectStatus status;

  _RecentProjectViewModel({required this.name, required this.path, required this.status});
}

class _RecentProjectsListMacos extends StatelessWidget {
  const _RecentProjectsListMacos();

  @override
  Widget build(BuildContext context) {
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
      _RecentProjectViewModel(name: 'another_project', path: '~/dev/another_project', status: _ProjectStatus.error),
    ];

    if (recentProjects.isEmpty) {
      return const Center(child: macos_ui.ProgressCircle());
    }

    return macos_ui.ContentArea(
      builder: (context, scrollController) {
        return ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          itemCount: recentProjects.length,
          itemBuilder: (context, index) {
            return _RecentProjectTileMacos(project: recentProjects[index]);
          },
        );
      },
    );
  }
}

class _RecentProjectsListYaru extends StatelessWidget {
  const _RecentProjectsListYaru();
  static final List<_RecentProjectViewModel> _recentProjectsData = List.generate(
    20,
    (index) => _RecentProjectViewModel(
      name: 'Recent Project ${index + 1}',
      path: '/some/linux/path/to/project ${index + 1}',
      status: _ProjectStatus.values[index % _ProjectStatus.values.length],
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (_recentProjectsData.isEmpty) {
      return const Center(child: Text("No recent projects."));
    }
    return YaruScrollViewUndershoot.builder(
      builder: (context, controller) {
        return ListView.builder(
          controller: controller,
          padding: const EdgeInsets.all(kYaruPagePadding),
          itemCount: _recentProjectsData.length,
          itemBuilder: (context, index) {
            final project = _recentProjectsData[index];
            return GestureDetector(
              onTap: () {},
              child: YaruTile(
                title: Text(project.name),
                subtitle: Text(project.path, overflow: TextOverflow.ellipsis, maxLines: 1),
                leading: const Icon(YaruIcons.music_note),
                trailing: const Icon(YaruIcons.information),
              ),
            );
          },
        );
      },
    );
  }
}

class _RecentProjectTileMacos extends StatelessWidget {
  final _RecentProjectViewModel project;

  const _RecentProjectTileMacos({required this.project});

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
        return macos_ui.MacosColors.appleGreen;
      case _ProjectStatus.warning:
        return macos_ui.MacosColors.appleOrange;
      case _ProjectStatus.error:
        return macos_ui.MacosColors.appleRed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return macos_ui.MacosListTile(
      onClick: () {
        // TODO: Implement opening project: _openProject(project.path);
      },
      title: Text(project.name),
      subtitle: Text(project.path, maxLines: 1, overflow: TextOverflow.ellipsis),
      leading: macos_ui.MacosIcon(_statusIcon, size: 22, color: _statusColor),
    );
  }
}
