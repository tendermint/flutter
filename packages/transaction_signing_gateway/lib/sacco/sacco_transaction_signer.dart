import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:sacco/tx_signer.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/signed_transaction.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/model/unsigned_transaction.dart';
import 'package:transaction_signing_gateway/sacco/sacco_private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/sacco/sacco_transaction.dart';
import 'package:transaction_signing_gateway/transaction_signer.dart';

class SaccoTransactionSigner implements TransactionSigner {
  @override
  bool canSign(UnsignedTransaction unsignedTransaction) => unsignedTransaction is SaccoTransaction;

  @override
  Future<Either<TransactionSigningFailure, SignedTransaction>> sign({
    required PrivateWalletCredentials privateCredentials,
    required UnsignedTransaction transaction,
  }) async {
    if (transaction is! SaccoTransaction) {
      return left(SaccoTransactionSigningFailure("passed transaction is not $SaccoTransaction"));
    }
    if (privateCredentials is! SaccoPrivateWalletCredentials) {
      return left(SaccoTransactionSigningFailure("passed privateCredentials is not $SaccoPrivateWalletCredentials"));
    }

    try {
      final signedTrans = await TxSigner.signStdTx(wallet: privateCredentials.saccoWallet, stdTx: transaction.stdTx);
      return right(SaccoTransaction(signedTrans));
    } catch (e, stack) {
      debugPrint("$e\n$stack");
      return left(SaccoTransactionSigningFailure(e));
    }
  }
}

class SaccoTransactionSigningFailure extends TransactionSigningFailure {
  final Object cause;

  SaccoTransactionSigningFailure(this.cause);

  @override
  TransactionSigningFailType get type => TransactionSigningFailType.unknown;

  @override
  String toString() {
    return 'SaccoTransactionSigningFailure{cause: $cause}';
  }
}
