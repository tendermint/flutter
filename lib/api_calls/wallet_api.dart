import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/balances.dart';
import 'package:flutter_app/models/transaction.dart';
import 'package:flutter_app/models/wallet_details.dart';
import 'package:sacco/models/transactions/std_msg.dart';
import 'package:sacco/tx_builder.dart';
import 'package:sacco/tx_sender.dart';
import 'package:sacco/tx_signer.dart';
import 'package:sacco/wallet.dart' as sacco;

import '../global.dart';

class WalletApi {
  void importWallet({required String mnemonicString, required String walletAlias}) {
    final mnemonic = mnemonicString.split(' ');
    final wallet = sacco.Wallet.derive(mnemonic, baseEnv.networkInfo);

    globalCache.wallets.add(
      WalletDetails(
        walletAddress: wallet.bech32Address,
        walletAlias: walletAlias,
        wallet: wallet,
      ),
    );
  }

  Future<BalancesModel> getWalletBalances(String walletAddress) async {
    final uri = Uri.parse('${baseEnv.baseApiUrl}/cosmos/bank/v1beta1/balances/$walletAddress');
    final response = await client.get(uri);
    final map = jsonDecode(response.body) as Map<String, dynamic>;
    return BalancesModel.fromJson(map);
  }

  Future<void> sendAmount({
    required String fromAddress,
    required String toAddress,
    required String denom,
    required String amount,
  }) async {
    final message = StdMsg(
      type: 'cosmos-sdk/MsgSend',
      value: Transaction(fromAddress: fromAddress, toAddress: toAddress, amount: [
        Amount(denom: denom, amount: amount),
      ]).toJson(),
    );
    final stdTx = TxBuilder.buildStdTx(stdMsgs: [message]);
    final wallet = globalCache.wallets.firstWhere((element) => element.walletAddress == fromAddress).wallet;
    final signedStdTx = await TxSigner.signStdTx(wallet: wallet, stdTx: stdTx);

    final result = await TxSender.broadcastStdTx(
      wallet: wallet,
      stdTx: signedStdTx,
      mode: 'block',
    );

    if (result.success) {
      debugPrint('Tx send successfully. Hash: ${result.hash}');
    } else {
      throw 'Tx send error: ${result.error?.errorMessage}';
    }
  }
}
