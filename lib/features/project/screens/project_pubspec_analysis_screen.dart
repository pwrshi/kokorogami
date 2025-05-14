import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Import Material for CircularProgressIndicator and ListView
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';

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

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Pubspec Analysis'),
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            // Use BlocBuilder to react to state changes and update the UI
            return BlocBuilder<ProjectBloc, ProjectState>(
              builder: (context, state) {
                switch (state.pubspecAnalysisStatus) {
                  case PubspecAnalysisStatus.initial:
                    // This state might not be reached if analysis starts in initState,
                    // but good to handle. Could show a button to start analysis.
                    return const Center(
                      child: Text('Press the button to analyze'),
                    );
                  case PubspecAnalysisStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case PubspecAnalysisStatus.success:
                    if (state.vulnerableDependencies.isEmpty) {
                      return const Center(
                        child: Text('No vulnerabilities found.'),
                      );
                    }
                    return ListView.builder(
                      controller:
                          scrollController, // Pass the scroll controller
                      itemCount: state.vulnerableDependencies.length,
                      itemBuilder: (context, index) {
                        final item = state.vulnerableDependencies[index];
                        return ListTile(
                          title: Text(
                            '${item.packageName} (${item.installedVersion})',
                          ),
                          subtitle: Text(
                            'CVE: ${item.cveId}\nSeverity: ${item.severity}\nDescription: ${item.description}',
                          ),
                          isThreeLine: true,
                        );
                      },
                    );
                  case PubspecAnalysisStatus.failure:
                    return Center(
                      child: Text(
                        'Error: ${state.pubspecAnalysisError ?? "Unknown error"}',
                      ),
                    );
                }
              },
            );
          },
        ),
      ],
    );
  }
}
