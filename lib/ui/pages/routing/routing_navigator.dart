import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/navigation/app_navigator.dart';
import 'package:flutter_app/navigation/close_route.dart';
import 'package:flutter_app/views/mnemonic_onboarding.dart';

class RoutingNavigator with MnemonicOnboardingRoute, CloseRoute {
  @override
  late BuildContext context;
  @override
  final AppNavigator appNavigator;

  RoutingNavigator(this.appNavigator);
}
