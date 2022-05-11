// ignore_for_file: do_not_use_environment

import 'dart:io';

import 'package:alan/alan.dart';

class BaseEnv {
  BaseEnv({
    String? lcdUrl,
    String? grpcUrl,
    String? lcdPort,
    String? grpcPort,
  })  : networkInfo = NetworkInfo(
          bech32Hrp: 'cosmos',
          lcdInfo: LCDInfo(
            host: lcdUrl ?? envLcdUrl,
            port: int.parse(lcdPort ?? envLcdPort),
          ),
          grpcInfo: GRPCInfo(
            host: grpcUrl ?? envGrpcUrl,
            port: int.parse(grpcPort ?? envGrpcPort),
          ),
        ),
        baseApiUrl = '${lcdUrl ?? envLcdUrl}:${lcdPort ?? envLcdPort}';
  final NetworkInfo networkInfo;

  final String baseApiUrl;
}

// DO NOT USE String.fromEnvironment without 'const'!!!
// https://github.com/flutter/flutter/issues/55870#issuecomment-620776138
String get envLcdPort => const String.fromEnvironment('LCD_PORT', defaultValue: '1317');

// DO NOT USE String.fromEnvironment without 'const'!!!
// https://github.com/flutter/flutter/issues/55870#issuecomment-620776138
String get envGrpcPort => const String.fromEnvironment('GRPC_PORT', defaultValue: '9090');

String get envLcdUrl {
  // DO NOT USE String.fromEnvironment without 'const'!!!
  // https://github.com/flutter/flutter/issues/55870#issuecomment-620776138
  const result = String.fromEnvironment('LCD_URL');
  if (result.isEmpty) {
    return Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost';
  }
  return result;
}

String get envGrpcUrl {
  // DO NOT USE String.fromEnvironment without 'const'!!!
  // https://github.com/flutter/flutter/issues/55870#issuecomment-620776138
  const result = String.fromEnvironment('GRPC_URL');
  if (result.isEmpty) {
    return Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost';
  }
  return result;
}
