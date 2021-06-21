import 'package:http/http.dart';
import 'package:sacco/network_info.dart';

import 'models/wallet_details.dart';

final Client client = Client();

class GlobalCache {
  List<WalletDetails> wallets;

  GlobalCache({required this.wallets});
}

final globalCache = GlobalCache(wallets: []);

class BaseEnv {
  late NetworkInfo _networkInfo;
  String? _apiProtocol;
  late String _baseApiUrl;

  void setEnv(String lcdUrl, String port) {
    final isLocal = lcdUrl == 'localhost';
    _apiProtocol = isLocal ? 'http' : 'https';
    final fullLcdUrl = '$_apiProtocol://$lcdUrl:$port';
    _networkInfo = NetworkInfo(
      bech32Hrp: 'cosmos',
      lcdUrl: Uri.parse(fullLcdUrl),
    );
    _baseApiUrl = fullLcdUrl;
  }

  NetworkInfo get networkInfo => _networkInfo;

  String get baseApiUrl => _baseApiUrl;
}

final BaseEnv baseEnv = BaseEnv();

abstract class SharedPreferencesKeys {
  static const isWalletCreated = 'IS_APP_INSTALLED';

  static const encryptedMnemonic = 'ENCRYPTED_MNEMONIC';
}
