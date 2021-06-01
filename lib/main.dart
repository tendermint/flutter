import 'package:flutter/material.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/views/wallet_list.dart';

void main() {
  var grpcUrl =
      const String.fromEnvironment('BASE_GRPC_URL', defaultValue: 'localhost');
  var grpcPort =
      const String.fromEnvironment('BASE_GRPC_PORT', defaultValue: '9090');
  var lcdUrl =
      const String.fromEnvironment('BASE_LCD_URL', defaultValue: 'localhost');

  baseEnv.setEnv(grpcUrl, lcdUrl, grpcPort);
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
      ),
      home: WalletListingPage(),
    );
  }
}
