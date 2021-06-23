import 'package:sacco/wallet.dart';
import 'package:flutter_app/models/wallet_details.dart';

class CosmosWallet extends BaseWalletDetails {
  Wallet wallet;

  CosmosWallet({
    required String walletAddress,
    required String walletAlias,
    WalletType walletType = WalletType.Cosmos,
    required this.wallet,
  }) : super(
          walletAlias: walletAlias,
          walletAddress: walletAddress,
          walletType: walletType,
        );
}
