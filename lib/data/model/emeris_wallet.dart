import 'package:flutter_app/data/model/wallet_type.dart';

class WalletDetails {
  final String walletAddress;
  final String walletAlias;

  const WalletDetails({
    required this.walletAlias,
    required this.walletAddress,
  });
}

abstract class EmerisWallet {
  WalletDetails get walletDetails;

  WalletType get walletType;
}
