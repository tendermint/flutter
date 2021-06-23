import 'package:flutter_app/models/wallet_details.dart';
import 'package:flutter_app/models/wallet_type.dart';
import 'package:web3dart/web3dart.dart';

class EthWallet extends BaseWalletDetails {
  Wallet wallet;

  EthWallet({
    required String walletAddress,
    required String walletAlias,
    WalletType walletType = WalletType.Eth,
    required this.wallet,
  }) : super(
          walletAlias: walletAlias,
          walletAddress: walletAddress,
          walletType: walletType,
        );
}
