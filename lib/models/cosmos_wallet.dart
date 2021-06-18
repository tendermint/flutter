import 'package:sacco/wallet.dart';

class CosmosWallet extends BaseWalletDetails {
  Wallet wallet;

  CosmosWallet({
    required walletAddress,
    required walletAlias,
    walletType = WalletType.Cosmos,
    required this.wallet,
  }) : super(
          walletAlias: walletAlias,
          walletAddress: walletAddress,
          walletType: walletType,
        );
}

class BaseWalletDetails {
  String walletAddress;
  String walletAlias;
  WalletType walletType;

  BaseWalletDetails({
    required this.walletType,
    required this.walletAlias,
    required this.walletAddress,
  });
}

enum WalletType { Eth, Cosmos }
