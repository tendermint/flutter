import 'package:flutter_app/data/model/emeris_wallet.dart';
import 'package:flutter_app/data/model/wallet_type.dart';
import 'package:sacco/sacco.dart';

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
