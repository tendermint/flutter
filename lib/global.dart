import 'package:flutter_app/api_calls/cosmos_api.dart';
import 'package:flutter_app/api_calls/ethereum_api.dart';
import 'package:http/http.dart';
import 'package:sacco/network_info.dart';
import 'package:flutter_app/models/wallet_details.dart';

import 'api_calls/cosmos_api.dart';
import 'api_calls/ethereum_api.dart';

final Client client = Client();

class GlobalCache {
  List<BaseWalletDetails> wallets;

  GlobalCache({required this.wallets});
}

final globalCache = GlobalCache(wallets: []);

class BaseEnv {
  late NetworkInfo _networkInfo;
  String? _apiProtocol;
  late String _baseApiUrl;
  late String _baseEthUrl;

  void setEnv(String lcdUrl, String port, String ethUrl) {
    final isLocal = lcdUrl == 'localhost';
    _apiProtocol = isLocal ? 'http' : 'https';
    final fullLcdUrl = '$_apiProtocol://$lcdUrl:$port';
    _networkInfo = NetworkInfo(
      bech32Hrp: 'cosmos',
      lcdUrl: Uri.parse(fullLcdUrl),
    );
    _baseApiUrl = fullLcdUrl;
    _baseEthUrl = ethUrl;
  }

  NetworkInfo get networkInfo => _networkInfo;

  String get baseApiUrl => _baseApiUrl;

  String get baseEthUrl => _baseEthUrl;
}

final BaseEnv baseEnv = BaseEnv();

final CosmosApi cosmosApi = CosmosApi();
final EthereumApi ethApi = EthereumApi();

abstract class SharedPreferencesKeys {
  static const isWalletCreated = 'IS_APP_INSTALLED';

  static const encryptedMnemonic = 'ENCRYPTED_MNEMONIC';
}
