import 'package:flutter_app/models/cosmos_wallet.dart';
import 'package:web3dart/web3dart.dart';

class EthWallet extends BaseWalletDetails {
  Wallet wallet;

  EthWallet({
    required walletAddress,
    required walletAlias,
    walletType = WalletType.Eth,
    required this.wallet,
  }) : super(
          walletAlias: walletAlias,
          walletAddress: walletAddress,
          walletType: walletType,
        );
}
