import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/app_navigator.dart';
import 'package:flutter_app/utils/app_theme.dart';
import 'package:flutter_app/views/mnemonic_onboarding.dart';

class AppWidget extends StatelessWidget {
  const AppWidget();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.buildAppTheme(),
      home: MnemonicOnboarding(),
      navigatorKey: AppNavigator.navigatorKey,
    );
  }
}
