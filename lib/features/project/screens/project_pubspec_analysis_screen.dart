import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Import Material for CircularProgressIndicator and ListView
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'dart:io' show Platform;
import 'package:yaru/yaru.dart';

// Import the BLoC and State
import '../bloc/project_bloc.dart';

@RoutePage()
class ProjectPubspecAnalysisScreen extends StatefulWidget {
  final String projectPath;
  const ProjectPubspecAnalysisScreen({super.key, required this.projectPath});

  @override
  State<ProjectPubspecAnalysisScreen> createState() =>
      _ProjectPubspecAnalysisScreenState();
}

class _ProjectPubspecAnalysisScreenState
    extends State<ProjectPubspecAnalysisScreen> {
  @override
  void initState() {
    super.initState();
    // Dispatch the analysis event when the screen is initialized
    // Ensure the BLoC is available in the widget tree (e.g., provided higher up)
    context.read<ProjectBloc>().add(
      ProjectEvents.analyzePubspec(projectPath: widget.projectPath),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ProjectState state,
    ScrollController? scrollController,
  ) {
    switch (state.pubspecAnalysisStatus) {
      case PubspecAnalysisStatus.initial:
        return const Center(child: Text('Press the button to analyze'));
      case PubspecAnalysisStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case PubspecAnalysisStatus.success:
        if (state.packagesWithVulnerabilities.isEmpty) {
          return const Center(
            child: Text('No packages found or all are clear.'),
          );
        }
        return ListView.builder(
          controller: scrollController, // Will be null for Yaru, used by Mac
          itemCount: state.packagesWithVulnerabilities.length,
          itemBuilder: (context, index) {
            final item = state.packagesWithVulnerabilities[index];
            String subtitleText;
            if (item.vulnerabilities != null &&
                item.vulnerabilities!.isNotEmpty) {
              final firstVuln = item.vulnerabilities!.first;
              subtitleText =
                  'Vulnerabilities Found:\n'
                  'ID: ${firstVuln.id}\n'
                  'Severity: ${firstVuln.databaseSpecific?.severity ?? (firstVuln.severity?.isNotEmpty == true ? firstVuln.severity!.first.score : 'N/A')}\n'
                  'Summary: ${firstVuln.summary ?? 'No summary available'}';
            } else {
              subtitleText = 'No vulnerabilities found for this package.';
            }
            if (Platform.isMacOS) {
              return MacosListTile(
                title: Text('${item.name} (${item.version})'),
                subtitle: Text(subtitleText),
              );
            } else {
              return ListTile(
                title: Text('${item.name} (${item.version})'),
                subtitle: Text(subtitleText),
                isThreeLine:
                    item.vulnerabilities != null &&
                    item.vulnerabilities!.isNotEmpty,
              );
            }
          },
        );
      case PubspecAnalysisStatus.failure:
        return Center(
          child: Text(
            'Error: ${state.pubspecAnalysisError ?? "Unknown error"}',
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS) {
      return Material(
        child: MacosScaffold(
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
            title: const Text('Pubspec Analysis'),
          ),
          children: [
            ContentArea(
              builder: (context, scrollController) {
                return BlocBuilder<ProjectBloc, ProjectState>(
                  builder: (context, state) {
                    return _buildContent(
                      context,
                      state,
                      scrollController,
                    ); // Pass scrollController for Mac
                  },
                );
              },
            ),
          ],
        ),
      );
    } else {
      // Yaru equivalent for other platforms
      return YaruDetailPage(
        appBar: const YaruWindowTitleBar(title: Text('Pubspec Analysis')),
        body: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            return _buildContent(
              context,
              state,
              null,
            ); // Pass null for scrollController for Yaru
          },
        ),
      );
    }
  }
}
