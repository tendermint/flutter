import 'package:flutter_app/models/balances.dart';

abstract class BaseWalletApi {
  void importWallet(
      {required String mnemonicString, required String walletAlias});

  Future<BalancesModel> getWalletBalances(String walletAddress);

  Future<void> sendAmount({
    required String fromAddress,
    required String toAddress,
    required String denom,
    required String amount,
  });
}
