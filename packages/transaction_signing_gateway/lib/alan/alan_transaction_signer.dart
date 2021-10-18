import 'package:alan/alan.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:transaction_signing_gateway/alan/alan_private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/alan/alan_transaction.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/signed_transaction.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/model/unsigned_transaction.dart';
import 'package:transaction_signing_gateway/transaction_signer.dart';

class AlanTransactionSigner implements TransactionSigner {
  final NetworkInfo _networkInfo;

  AlanTransactionSigner(this._networkInfo);

  @override
  bool canSign(UnsignedTransaction unsignedTransaction) => unsignedTransaction is UnsignedAlanTransaction;

  @override
  Future<Either<TransactionSigningFailure, SignedTransaction>> sign({
    required PrivateWalletCredentials privateCredentials,
    required UnsignedTransaction transaction,
  }) async {
    if (transaction is! UnsignedAlanTransaction) {
      return left(AlanTransactionSigningFailure("passed transaction is not $UnsignedAlanTransaction"));
    }
    if (privateCredentials is! AlanPrivateWalletCredentials) {
      return left(AlanTransactionSigningFailure("passed privateCredentials is not $AlanPrivateWalletCredentials"));
    }

    try {
      final signer = TxSigner.fromNetworkInfo(_networkInfo);
      final signedTrans = await signer.createAndSign(
        privateCredentials.alanWallet(_networkInfo),
        transaction.messages,
        memo: transaction.memo,
        fee: transaction.fee,
      );
      return right(SignedAlanTransaction(signedTransaction: signedTrans));
    } catch (e, stack) {
      debugPrint("$e\n$stack");
      return left(AlanTransactionSigningFailure(e));
    }
  }
}

class AlanTransactionSigningFailure extends TransactionSigningFailure {
  final Object cause;

  AlanTransactionSigningFailure(this.cause);

  @override
  TransactionSigningFailType get type => TransactionSigningFailType.unknown;

  @override
  String toString() {
    return 'AlanTransactionSigningFailure{cause: $cause}';
  }
}
