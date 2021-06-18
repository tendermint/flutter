import 'package:flutter_app/api_calls/cosmos_api.dart';
import 'package:flutter_app/api_calls/eth_api.dart';
import 'package:http/http.dart';
import 'package:sacco/network_info.dart';

import 'models/cosmos_wallet.dart';

final Client client = Client();

class GlobalCache {
  List<BaseWalletDetails> wallets;

  GlobalCache({required this.wallets});
}

final globalCache = GlobalCache(wallets: []);

class BaseEnv {
  NetworkInfo? _networkInfo;
  String? _apiProtocol;
  String? _baseApiUrl;
  String? _baseEthUrl;

  setEnv(lcdUrl, port, ethUrl) {
    var isLocal = lcdUrl == 'localhost';
    _apiProtocol = isLocal ? 'http' : 'https';
    var fullLcdUrl = '$_apiProtocol://$lcdUrl:$port';
    _networkInfo = NetworkInfo(
      bech32Hrp: 'cosmos',
      lcdUrl: Uri.parse(fullLcdUrl),
    );
    _baseApiUrl = fullLcdUrl;
    _baseEthUrl = ethUrl;
  }

  NetworkInfo get networkInfo => _networkInfo!;

  String get baseApiUrl => _baseApiUrl!;

  String get baseEthUrl => _baseEthUrl!;
}

final BaseEnv baseEnv = BaseEnv();

final CosmosApi cosmosApi = CosmosApi();
final EthApi ethApi = EthApi();



abstract class SharedPreferencesKeys {
  static const isWalletCreated = 'IS_APP_INSTALLED';

  static const encryptedMnemonic = 'ENCRYPTED_MNEMONIC';
}
