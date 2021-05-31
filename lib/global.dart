import 'package:alan/alan.dart';
import 'package:http/http.dart';

import 'models/wallet_details.dart';

final Client client = Client();

class GlobalCache {
  List<WalletDetails> wallets;

  GlobalCache({required this.wallets});
}

final globalCache = GlobalCache(wallets: []);

final globalNetworkInfo = NetworkInfo.fromSingleHost(
  bech32Hrp: 'cosmos',
  host: 'localhost',
);