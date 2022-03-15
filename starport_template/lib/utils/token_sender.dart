import 'package:alan/alan.dart' as alan;
import 'package:alan/proto/cosmos/bank/v1beta1/export.dart' as bank;
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:transaction_signing_gateway/model/account_lookup_key.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class TokenSender {
  TokenSender(this.transactionSigningGateway);

  TransactionSigningGateway transactionSigningGateway;

  Future<void> sendCosmosMoney(
    AccountPublicInfo info,
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

    final accountLookupKey = AccountLookupKey(
      accountId: info.accountId,
      chainId: info.chainId,
      password: password,
    );

    final result = await transactionSigningGateway
        .signTransaction(
          transaction: unsignedTransaction,
          accountLookupKey: accountLookupKey,
        )
        .mapError<dynamic>((error) => throw error)
        .flatMap(
          (signed) => transactionSigningGateway.broadcastTransaction(
            accountLookupKey: accountLookupKey,
            transaction: signed,
          ),
        );
    result.fold(
      (fail) => throw fail as Object,
      (tx) => debugPrint('new TX hash: $tx'),
    );
  }
}
