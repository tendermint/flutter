// ignore_for_file: do_not_use_environment

import 'dart:io';

import 'package:alan/alan.dart';
import 'package:grpc/grpc.dart';
import 'package:starport_template/base_env.dart';

class BaseEnvUtil {
  BaseEnvUtil(BaseEnv env)
      : networkInfo = NetworkInfo(
          bech32Hrp: prefixAddress ?? env.prefixAddress,
          lcdInfo: LCDInfo(
            host: lcdUrl ?? env.envLcdUrl,
            port: int.parse(lcdPort ?? env.envLcdPort),
          ),
          grpcInfo: GRPCInfo(
            host: grpcUrl ?? env.envGrpcUrl,
            port: int.parse(grpcPort ?? env.envGrpcPort),
            credentials: int.parse(grpcPort ?? env.envGrpcPort) == 443
                ? const ChannelCredentials.secure()
                : const ChannelCredentials.insecure(),
          ),
        ),
        baseApiUrl = lcdUrl != null && lcdPort != null ? '$lcdUrl:$lcdPort' : env.envBaseApiUrl;

  final NetworkInfo networkInfo;

  final String baseApiUrl;
}

String? get prefixAddress {
  // DO NOT USE String.fromEnvironment without 'const'!!!
  // https://github.com/flutter/flutter/issues/55870#issuecomment-620776138
  const result = String.fromEnvironment('PREFIX_ADDR');
  if (result.isNotEmpty) {
    return result;
  }
  return null;
}

String? get lcdPort {
  // DO NOT USE String.fromEnvironment without 'const'!!!
  // https://github.com/flutter/flutter/issues/55870#issuecomment-620776138
  const result = String.fromEnvironment('LCD_PORT');
  if (result.isNotEmpty) {
    return result;
  }
  return null;
}

String? get grpcPort {
  // DO NOT USE String.fromEnvironment without 'const'!!!
  // https://github.com/flutter/flutter/issues/55870#issuecomment-620776138
  const result = String.fromEnvironment('GRPC_PORT');

  if (result.isNotEmpty) {
    return result;
  }
  return null;
}

String? get lcdUrl {
  // DO NOT USE String.fromEnvironment without 'const'!!!
  // https://github.com/flutter/flutter/issues/55870#issuecomment-620776138
  const result = String.fromEnvironment('LCD_URL');

  if (result.isNotEmpty) {
    return Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost';
  }
  return null;
}

String? get grpcUrl {
  // DO NOT USE String.fromEnvironment without 'const'!!!
  // https://github.com/flutter/flutter/issues/55870#issuecomment-620776138
  const result = String.fromEnvironment('GRPC_URL');
  if (result.isNotEmpty) {
    return Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost';
  }
  return null;
}
