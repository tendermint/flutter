import 'package:flutter_app/models/emeris_wallet.dart';
import 'package:flutter_app/models/wallet_type.dart';
import 'package:web3dart/web3dart.dart';

class EthereumWallet implements EmerisWallet {
  final Wallet wallet;
  final BaseWalletDetails baseWalletDetails;

  EthereumWallet({
    required this.baseWalletDetails,
    required this.wallet,
  });

  @override
  BaseWalletDetails get walletDetails => baseWalletDetails;

  @override
  WalletType get walletType => WalletType.Eth;
}
