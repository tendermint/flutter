import 'package:flutter/material.dart';
import 'package:flutter_app/app_widget.dart';
import 'package:flutter_app/dependency_injection/app_component.dart';
import 'package:flutter_app/global.dart';

void main() {
  const port = String.fromEnvironment('PORT', defaultValue: '1317');
  const lcdUrl = String.fromEnvironment('BASE_LCD_URL', defaultValue: 'localhost');

  const ethUrl = String.fromEnvironment('BASE_ETH_URL', defaultValue: 'HTTP://127.0.0.1:7545');

  baseEnv.setEnv(lcdUrl, port, ethUrl);
  configureDependencies();
  runApp(EmerisApp());
}

class EmerisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const AppWidget();
  }
}
