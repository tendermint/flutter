import 'package:flutter/material.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/views/mnemonic_onboarding.dart';

void main() {
  var port =
      const String.fromEnvironment('BASE_COSMOS_PORT', defaultValue: '1317');
  var lcdUrl =
      const String.fromEnvironment('BASE_LCD_URL', defaultValue: 'localhost');

  var ethUrl = const String.fromEnvironment('BASE_ETH_URL',
      defaultValue: 'HTTP://127.0.0.1:7545');

  baseEnv.setEnv(lcdUrl, port, ethUrl);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme:
              InputDecorationTheme(border: OutlineInputBorder())),
      home: MnemonicOnboarding(),
    );
  }
}
