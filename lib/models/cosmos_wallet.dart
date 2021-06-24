import 'package:flutter_app/models/wallet_type.dart';
import 'package:sacco/wallet.dart';
import 'package:flutter_app/models/emeris_wallet.dart';

class CosmosWallet implements EmerisWallet {
  final Wallet wallet;
  @override
  final WalletDetails walletDetails;

  CosmosWallet({
    required this.walletDetails,
    required this.wallet,
  });

  @override
  WalletType get walletType => WalletType.Cosmos;
}
