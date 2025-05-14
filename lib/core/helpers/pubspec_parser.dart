import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';
// Updated import path for PackageInfo model
import '../../features/project/data/models/package_info.dart';

class PubspecParser {
  static Future<List<PackageInfo>> extractDependencies(
    String projectPath,
  ) async {
    final pubspecFilePath = p.join(projectPath, 'pubspec.yaml');
    final pubspecFile = File(pubspecFilePath);

    if (!await pubspecFile.exists()) {
      throw Exception('pubspec.yaml not found at $pubspecFilePath');
    }

    final content = await pubspecFile.readAsString();
    final yamlDoc = loadYaml(content);

    final List<PackageInfo> packages = [];

    if (yamlDoc is! YamlMap) {
      throw Exception('Invalid pubspec.yaml format.');
    }

    final dependencies = yamlDoc['dependencies'] as YamlMap?;
    if (dependencies != null) {
      dependencies.forEach((key, value) {
        String version =
            'any'; // Default if version is not specified or is complex
        if (value is String) {
          version = value;
        } else if (value is YamlMap) {
          if (value.containsKey('version')) {
            version = value['version'] as String? ?? 'any';
          } else {
            // For git, path, or other complex dependencies, version might not be a simple string.
            // For MVP, we can use a placeholder or a string representation of the map.
            version =
                value
                    .toString(); // Or a more specific placeholder like '[complex_dependency]'
          }
        }
        // Ensure key is a string before using it
        if (key is String) {
          packages.add(PackageInfo(name: key, version: version));
        } else {
          // Handle cases where key might not be a string, though unlikely for valid pubspec.yaml
          packages.add(PackageInfo(name: key.toString(), version: version));
        }
      });
    }

    // Optionally, parse dev_dependencies as well
    // final devDependencies = yamlDoc['dev_dependencies'] as YamlMap?;
    // if (devDependencies != null) {
    //   devDependencies.forEach((key, value) {
    //     // ... similar logic ...
    //   });
    // }

    return packages;
  }
}
