import 'package:alan/alan.dart' as alan;
import 'package:alan/proto/cosmos/bank/v1beta1/export.dart' as bank;
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:transaction_signing_gateway/alan/alan_transaction.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';
import 'package:transaction_signing_gateway/model/wallet_lookup_key.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class TokenSender {
  TokenSender(this.transactionSigningGateway);

  TransactionSigningGateway transactionSigningGateway;

  Future<void> sendCosmosMoney(
    WalletPublicInfo info,
    Balance balance,
    String toAddress,
    String password,
  ) async {
    final message = bank.MsgSend.create()
      ..fromAddress = info.publicAddress
      ..toAddress = toAddress;
    message.amount.add(
      alan.Coin.create()
        ..denom = balance.denom.text
        ..amount = balance.amount.value.toString(),
    );

    final unsignedTransaction = UnsignedAlanTransaction(messages: [message]);

    final walletLookupKey = WalletLookupKey(
      walletId: info.walletId,
      chainId: info.chainId,
      password: password,
    );

    final result = await transactionSigningGateway
        .signTransaction(
          transaction: unsignedTransaction,
          walletLookupKey: walletLookupKey,
        )
        .mapError<dynamic>((error) => throw error)
        .flatMap(
          (signed) => transactionSigningGateway.broadcastTransaction(
            walletLookupKey: walletLookupKey,
            transaction: signed,
          ),
        );
    result.fold(
      (fail) => throw fail as Object,
      (hash) => debugPrint('new TX hash: $hash'),
    );
  }
}
