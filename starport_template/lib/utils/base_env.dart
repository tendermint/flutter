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

String get envLcdPort => const String.fromEnvironment('LCD_PORT', defaultValue: '1317');

String get envGrpcPort => const String.fromEnvironment('GRPC_PORT', defaultValue: '9090');

String get envLcdUrl => String.fromEnvironment(
      'LCD_URL',
      defaultValue: Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost',
    );

String get envGrpcUrl => String.fromEnvironment(
      'GRPC_URL',
      defaultValue: Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost',
    );
