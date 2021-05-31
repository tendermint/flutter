import 'package:alan/alan.dart';

import 'balances.dart';

class WalletDetails {
  String walletAddress;
  String walletAlias;
  Wallet wallet;

  WalletDetails({
    required this.walletAddress,
    required this.walletAlias,
    required this.wallet,
  });
}
