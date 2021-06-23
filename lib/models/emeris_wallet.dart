import 'package:flutter_app/models/wallet_type.dart';

class BaseWalletDetails {
  final String walletAddress;
  final String walletAlias;

  const BaseWalletDetails({
    required this.walletAlias,
    required this.walletAddress,
  });
}

abstract class EmerisWallet {
  BaseWalletDetails get walletDetails;

  WalletType get walletType;
}
