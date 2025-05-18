import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kokorogami/core/services/vulnerability_service.dart';
import 'package:kokorogami/entrypoint/di.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../features/project/bloc/project_bloc.dart';

Future<void> injectDependencies() async {
  di
    ..registerSingletonAsync<BaseDeviceInfo>(() => DeviceInfoPlugin().deviceInfo)
    ..registerSingletonAsync<PackageInfo>(() => PackageInfo.fromPlatform())
    ..registerSingleton<FilePicker>(FilePicker.platform)
    ..registerLazySingleton<VulnerabilityService>(() => VulnerabilityService())
    ..registerFactory<ProjectBloc>(() => ProjectBloc(di<VulnerabilityService>()));

  await di.allReady();
}
