import 'package:sacco/wallet.dart';

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
