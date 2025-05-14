import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kokorogami/entrypoint/di.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Import the repository and bloc
import '../features/project/data/repositories/abstract_cve_repository.dart';
import '../features/project/data/repositories/api_cve_repository.dart';
import '../features/project/bloc/project_bloc.dart';

Future<void> injectDependencies() async {
  di
    ..registerSingletonAsync<BaseDeviceInfo>(
      () => DeviceInfoPlugin().deviceInfo,
    )
    ..registerSingletonAsync<PackageInfo>(() => PackageInfo.fromPlatform())
    ..registerSingleton<FilePicker>(FilePicker.platform)
    // Register the CVE Repository
    ..registerLazySingleton<AbstractCveRepository>(
      () => ApiCveRepository(),
    ) // Using the mock implementation for now
    // Register the ProjectBloc, providing the repository
    ..registerFactory<ProjectBloc>(
      () => ProjectBloc(di<AbstractCveRepository>()),
    );

  await di.allReady();
}
