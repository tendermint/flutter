import 'package:flutter_app/models/wallet_type.dart';
import 'package:sacco/wallet.dart';
import 'package:flutter_app/models/emeris_wallet.dart';

class CosmosWallet implements EmerisWallet {
  final Wallet wallet;
  final WalletDetails baseWalletDetails;

  CosmosWallet({
    required this.baseWalletDetails,
    required this.wallet,
  });

  @override
  WalletDetails get walletDetails => baseWalletDetails;

  @override
  WalletType get walletType => WalletType.Cosmos;
}
