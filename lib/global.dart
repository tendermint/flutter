import 'package:alan/alan.dart';
import 'package:http/http.dart';

import 'models/wallet_details.dart';

final Client client = Client();

class GlobalCache {
  List<WalletDetails> wallets;

  GlobalCache({required this.wallets});
}

final globalCache = GlobalCache(wallets: []);

class BaseEnv {
  NetworkInfo? _networkInfo;

  setEnv(grpcUrl, lcdUrl, grpcPort) {
    _networkInfo = NetworkInfo(
        bech32Hrp: 'cosmos',
        grpcInfo: GRPCInfo(
          host: grpcUrl,
          port: int.tryParse(grpcPort.toString())!,
        ),
        lcdInfo: LCDInfo(host: lcdUrl));
  }

  NetworkInfo get networkInfo => _networkInfo!;
}

final BaseEnv baseEnv = BaseEnv();
