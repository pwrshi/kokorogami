import 'dart:io';

import 'package:pubspec_parse/pubspec_parse.dart';

abstract class ProjectHelpers {
  static Future<bool> pubspecIsValidInDirectory(String path) async {
    final file = File('$path/pubspec.yaml');
    if (!file.existsSync()) return false;
    try {
      Pubspec.parse(await file.readAsString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
