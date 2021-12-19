import 'package:package_info/package_info.dart';

Future<AppInfo> getAppInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();

  return AppInfo(
    packageName: packageInfo.packageName,
    appName: packageInfo.appName,
    buildNumber: packageInfo.buildNumber,
    version: packageInfo.version,
  );
}

class AppInfo {
  AppInfo({
    required this.packageName,
    required this.appName,
    required this.buildNumber,
    required this.version,
  });

  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;
}
