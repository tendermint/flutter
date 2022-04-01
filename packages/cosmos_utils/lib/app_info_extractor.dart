import 'dart:convert';

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

  factory AppInfo.fromJson(Map<String, dynamic> json) => AppInfo(
        packageName: json['packageName'] as String? ?? '',
        appName: json['appName'] as String? ?? '',
        buildNumber: json['buildNumber'] as String? ?? '',
        version: json['version'] as String? ?? '',
      );

  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;

  Map<String, dynamic> toJson() => {
        'appName': appName,
        'packageName': packageName,
        'version': version,
        'buildNumber': buildNumber,
      };

  String toJsonString() => jsonEncode(toJson());
}
