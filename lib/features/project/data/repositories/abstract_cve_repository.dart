// Updated import paths for models
import '../models/package_info.dart';
import '../models/vulnerable_dependency.dart';

abstract class AbstractCveRepository {
  Future<List<VulnerableDependency>> checkDependencies({
    required String projectPath, // May be used by implementations for context
    required List<PackageInfo> packages,
  });
}
