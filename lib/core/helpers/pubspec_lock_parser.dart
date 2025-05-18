import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';
import 'package:kokorogami/features/project/data/models/package_info.dart'; // Assuming this model can be reused or adapted

class PubspecLockParser {
  static Future<List<PackageInfo>> extractResolvedDependencies(String projectPath) async {
    final pubspecLockFilePath = p.join(projectPath, 'pubspec.lock');
    final pubspecLockFile = File(pubspecLockFilePath);

    if (!await pubspecLockFile.exists()) {
      throw Exception('pubspec.lock not found at $pubspecLockFilePath');
    }

    final content = await pubspecLockFile.readAsString();
    final yamlDoc = loadYaml(content);

    final List<PackageInfo> packages = [];

    if (yamlDoc is! YamlMap) {
      throw Exception('Invalid pubspec.lock format.');
    }

    final packagesMap = yamlDoc['packages'] as YamlMap?;
    if (packagesMap != null) {
      packagesMap.forEach((key, value) {
        if (key is String && value is YamlMap) {
          final version = value['version'] as String?;
          // We are interested in direct and indirect dependencies of 'hosted' type primarily.
          // Other types like 'sdk', 'path', 'git' might not be relevant for osv.dev,
          // or osv.dev might not have info on them.
          final sourceType = value['source'] as String?;
          final description = value['description'];
          String packageName = key;

          // For some packages, the description itself is a map containing the name.
          // For others, the key is the name.
          if (description is YamlMap && description.containsKey('name')) {
            packageName = description['name'] as String;
          }

          if (version != null && sourceType == 'hosted') {
            packages.add(PackageInfo(name: packageName, version: version));
          }
        }
      });
    }
    return packages;
  }
}
