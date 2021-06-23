import 'package:flutter_app/models/wallet_type.dart';

class BaseWalletDetails {
  final String walletAddress;
  final String walletAlias;
  final WalletType walletType;

  const BaseWalletDetails({
    required this.walletType,
    required this.walletAlias,
    required this.walletAddress,
  });
}
