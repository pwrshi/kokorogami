import 'dart:io' as io;

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:kokorogami/entrypoint/entrypoint.dart';
import 'package:kokorogami/entrypoint/init_di.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru/yaru.dart';
import 'package:analyzer/dart/ast/ast.dart';

Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig();
  await config.apply();
}

Future<void> _configureFixedSize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
}

Future<void> main() async {
  if (io.Platform.isMacOS) {
    await _configureMacosWindowUtils();
  } else {
    await YaruWindowTitleBar.ensureInitialized();
  }
  await _configureFixedSize();
  await injectDependencies();

  List<String> includedPaths = <String>[
    '/Users/pwrshi/kokorogami/lib/core/models/osv_vulnerability.dart',
    '/Users/pwrshi/kokorogami/lib/core/helpers/pubspec_lock_parser.dart',
    '/Users/pwrshi/kokorogami/lib/core/helpers/pubspec_parser.dart',
    '/Users/pwrshi/kokorogami/lib/core/helpers/project_helpers.dart',
    '/Users/pwrshi/kokorogami/lib/core/services/vulnerability_service.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/screens/project_pubspec_analysis_screen.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/screens/project_sadt_screen.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/screens/project_overview_screen.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/screens/project_navigation_wrapper_screen.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/data/repositories/api_cve_repository.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/data/repositories/abstract_cve_repository.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/data/models/vulnerable_dependency.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/data/models/package_info.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/bloc/project_state.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/bloc/project_bloc.dart',
    '/Users/pwrshi/kokorogami/lib/features/project/bloc/project_events.dart',
    '/Users/pwrshi/kokorogami/lib/features/recent/screens/recent_screen.dart',
    '/Users/pwrshi/kokorogami/lib/gen/core/models/osv_vulnerability.g.dart',
    '/Users/pwrshi/kokorogami/lib/gen/core/models/osv_vulnerability.freezed.dart',
    '/Users/pwrshi/kokorogami/lib/gen/features/project/data/models/package_info.g.dart',
    '/Users/pwrshi/kokorogami/lib/gen/features/project/data/models/vulnerable_dependency.freezed.dart',
    '/Users/pwrshi/kokorogami/lib/gen/features/project/data/models/package_info.freezed.dart',
    '/Users/pwrshi/kokorogami/lib/gen/features/project/bloc/project_bloc.freezed.dart',
    '/Users/pwrshi/kokorogami/lib/gen/assets.gen.dart',
    '/Users/pwrshi/kokorogami/lib/main.dart',
    '/Users/pwrshi/kokorogami/lib/entrypoint/routes.dart',
    '/Users/pwrshi/kokorogami/lib/entrypoint/di.dart',
    '/Users/pwrshi/kokorogami/lib/entrypoint/init_di.dart',
    '/Users/pwrshi/kokorogami/lib/entrypoint/entrypoint.dart',
    '/Users/pwrshi/kokorogami/lib/entrypoint/routes.gr.dart',
  ];
  AnalysisContextCollection collection = AnalysisContextCollection(
    includedPaths: includedPaths,
    sdkPath: '/Users/pwrshi/fvm/versions/3.29.3/bin/cache/dart-sdk',
    resourceProvider: PhysicalResourceProvider.INSTANCE,
  );
  analyzeSomeFiles(collection, includedPaths);

  runApp(const App());
}

void analyzeSomeFiles(
  AnalysisContextCollection collection,
  List<String> includedPaths,
) {
  for (String path in includedPaths) {
    AnalysisContext context = collection.contextFor(path);
    analyzeSingleFile(context, path);
  }
}

void analyzeAllFiles(AnalysisContextCollection collection) {
  for (AnalysisContext context in collection.contexts) {
    for (String path in context.contextRoot.analyzedFiles()) {
      analyzeSingleFile(context, path);
    }
  }
}

void analyzeSingleFile(AnalysisContext context, String path) {
  AnalysisSession session = context.currentSession;
  io.File file = io.File(path);
  String content = file.readAsStringSync();
  CompilationUnit unit = parseString(content: content).unit;
  IfCounter counter = IfCounter();
  unit.accept(counter);
  print('If count: ${counter.ifCount}');
}

class IfCounter extends RecursiveAstVisitor<void> {
  int ifCount = 0;

  @override
  void visitIfStatement(IfStatement node) {
    ifCount++;
    super.visitIfStatement(node);
  }
}
