import 'package:cosmos_utils/app_info_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppVersionText extends StatelessWidget {
  const AppVersionText({
    required this.appInfoProvider,
    this.style,
    Key? key,
  }) : super(key: key);
  final AppInfoProvider appInfoProvider;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) => FutureBuilder<String>(
        future: appInfoProvider.getAppVersion(),
        builder: (context, snapshot) => Text(
          snapshot.data ?? '',
          style: style,
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AppInfoProvider>('appInfoProvider', appInfoProvider))
      ..add(DiagnosticsProperty<TextStyle?>('style', style));
  }
}
