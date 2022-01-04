import 'package:cosmos_utils/app_info_extractor.dart';
import 'package:cosmos_utils/app_info_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// TODO: Make this intelligent enough to display all of the properties inside [AppInfo] configurable from outside

class AppVersionText extends StatefulWidget {
  const AppVersionText({required this.appInfoProvider, Key? key}) : super(key: key);
  final AppInfoProvider appInfoProvider;

  @override
  State<AppVersionText> createState() => _AppVersionTextState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AppInfoProvider>('appInfoProvider', appInfoProvider));
  }
}

class _AppVersionTextState extends State<AppVersionText> {
  bool isLoading = false;
  String version = '';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Text('v $version');
  }

  Future<void> _getAppVersion() async {
    version = await widget.appInfoProvider.getAppVersion();
    setState(() {});
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('version', version))
      ..add(DiagnosticsProperty<bool>('isLoading', isLoading));
  }
}
