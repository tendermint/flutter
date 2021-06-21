import 'package:flutter/material.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/views/mnemonic_onboarding.dart';

void main() {
  const port = String.fromEnvironment('PORT', defaultValue: '1317');
  const lcdUrl = String.fromEnvironment('BASE_LCD_URL', defaultValue: 'localhost');

  const ethUrl = String.fromEnvironment('BASE_ETH_URL',
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
          primarySwatch: Colors.blue, inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder())),
      home: MnemonicOnboarding(),
    );
  }
}
