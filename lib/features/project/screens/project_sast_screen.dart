import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'dart:io' show Platform;
import 'package:yaru/yaru.dart';

@RoutePage()
class ProjectSastScreen extends StatelessWidget {
  const ProjectSastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS) {
      return MacosScaffold(
        toolBar: ToolBar(
          leading: MacosTooltip(
            message: 'Toggle Sidebar',
            useMousePosition: false,
            child: MacosIconButton(
              icon: MacosIcon(
                CupertinoIcons.sidebar_left,
                color: MacosTheme.brightnessOf(context).resolve(
                  const Color.fromRGBO(0, 0, 0, 0.5),
                  const Color.fromRGBO(255, 255, 255, 0.5),
                ),
                size: 20.0,
              ),
              boxConstraints: const BoxConstraints(
                minHeight: 20,
                minWidth: 20,
                maxWidth: 48,
                maxHeight: 38,
              ),
              onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
            ),
          ),
          title: const Text('SADT Analysis'),
        ),
        children: [
          ContentArea(
            builder: (context, scrollController) {
              return const Center(child: Text('SADT Analysis'));
            },
          ),
        ],
      );
    } else {
      // Yaru equivalent for other platforms
      return const YaruDetailPage(
        appBar: YaruWindowTitleBar(title: Text('SADT Analysis')),
        body: Center(child: Text('SADT Analysis')),
      );
    }
  }
}
