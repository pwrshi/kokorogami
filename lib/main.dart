import 'package:flutter/cupertino.dart';
import 'package:kokorogami/entrypoint/entrypoint.dart';
import 'package:kokorogami/entrypoint/init_di.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_manager/window_manager.dart';

/// This method initializes macos_window_utils and styles the window.
Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig();
  await config.apply();
}

Future<void> _configureFixedSize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
}

Future<void> main() async {
  await _configureMacosWindowUtils();
  await _configureFixedSize();
  await injectDependencies();
  runApp(const App());
}
