import 'package:alan/alan.dart';
import 'package:http/http.dart';
import 'package:grpc/grpc.dart' as grpc;

import 'models/wallet_details.dart';

final Client client = Client();

class GlobalCache {
  List<WalletDetails> wallets;

  GlobalCache({required this.wallets});
}

final globalCache = GlobalCache(wallets: []);

class BaseEnv {
  NetworkInfo? _networkInfo;
  String? _apiProtocol;
  String? _baseApiUrl;

  setEnv(grpcUrl, lcdUrl, grpcPort) {
    var isLocal = grpcUrl == 'localhost';
    _apiProtocol = isLocal ? 'http' : 'https';
    var fullLcdUrl = '$_apiProtocol://$lcdUrl';
    _networkInfo = NetworkInfo(
      bech32Hrp: 'cosmos',
      grpcInfo: GRPCInfo(
        host: grpcUrl,
        credentials: isLocal
            ? grpc.ChannelCredentials.insecure()
            : grpc.ChannelCredentials.secure(),
        port: int.tryParse(grpcPort.toString())!,
      ),
      lcdInfo: isLocal
          ? LCDInfo(host: fullLcdUrl)
          : LCDInfo(
              host: fullLcdUrl,
              port: grpcPort,
            ),
    );
    var apiPort = isLocal ? networkInfo.lcdInfo.port : grpcPort;
    _baseApiUrl = '${_networkInfo!.lcdInfo.host}:$apiPort';
  }

  NetworkInfo get networkInfo => _networkInfo!;

  String get baseApiUrl => _baseApiUrl!;
}

final BaseEnv baseEnv = BaseEnv();
