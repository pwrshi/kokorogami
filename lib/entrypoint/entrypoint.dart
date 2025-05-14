import 'package:flutter/material.dart';
import 'package:kokorogami/entrypoint/routes.dart';
import 'package:macos_ui/macos_ui.dart';

final _router = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosApp.router(
      routerConfig: _router.config(),
      title: 'kokorogami',
      theme: MacosThemeData.light(isMainWindow: true),
      darkTheme: MacosThemeData.dark(isMainWindow: true),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
