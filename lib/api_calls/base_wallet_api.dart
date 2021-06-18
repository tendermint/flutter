import 'package:flutter/material.dart';
import 'package:flutter_app/models/balances.dart';
import 'package:flutter_app/models/cosmos_wallet.dart';

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
