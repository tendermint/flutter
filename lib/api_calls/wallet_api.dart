import 'dart:convert';
import 'package:alan/proto/cosmos/bank/v1beta1/export.dart' as bank;
import 'package:alan/alan.dart' as alan;
import 'package:flutter_app/models/balances.dart';
import 'package:flutter_app/models/wallet_details.dart';

import '../global.dart';

class WalletApi {
  importWallet({required String mnemonicString, required String walletAlias}) {
    final mnemonic = mnemonicString.split(' ');
    final wallet = alan.Wallet.derive(mnemonic, globalNetworkInfo);

    globalCache.wallets.add(
      WalletDetails(
        walletAddress: wallet.bech32Address,
        walletAlias: walletAlias,
        wallet: wallet,
      ),
    );
  }

  Future<BalancesModel> getWalletBalances(String walletAddress) async {
    final Uri uri = Uri.parse(
        'http://localhost:1317/cosmos/bank/v1beta1/balances/$walletAddress');
    var response = await client.get(uri);
    var map = jsonDecode(response.body);
    return BalancesModel.fromJson(map);
  }

  Future sendAmount({
    required String fromAddress,
    required String toAddress,
    required String denom,
    required String amount,
  }) async {
    final message = bank.MsgSend.create()
      ..fromAddress = fromAddress
      ..toAddress = toAddress;
    message.amount.add(alan.Coin.create()
      ..denom = denom
      ..amount = amount);

    final signer = alan.TxSigner.fromNetworkInfo(globalNetworkInfo);
    final tx = await signer.createAndSign(
        globalCache.wallets
            .firstWhere((element) => element.walletAddress == fromAddress)
            .wallet,
        [message]);

    // 4. Broadcast the transaction
    final txSender = alan.TxSender.fromNetworkInfo(globalNetworkInfo);
    final response = await txSender.broadcastTx(tx);

    // Check the result
    if (response.isSuccessful) {
      print('Tx sent successfully. Response: ${response}');
    } else {
      print('Tx errored: ${response}');
    }
  }
}
