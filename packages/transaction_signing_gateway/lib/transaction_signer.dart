import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/signed_transaction.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

abstract class TransactionSigner {
  Future<Either<TransactionSigningFailure, SignedTransaction>> sign({
    required PrivateWalletCredentials privateCredentials,
    required UnsignedTransaction transaction,
  });

  bool canSign(UnsignedTransaction unsignedTransaction);
}

class NotFoundTransactionSigner implements TransactionSigner {
  @override
  bool canSign(UnsignedTransaction unsignedTransaction) => true;

  @override
  Future<Either<TransactionSigningFailure, SignedTransaction>> sign({
    required PrivateWalletCredentials privateCredentials,
    required UnsignedTransaction transaction,
  }) async =>
      left(const TransactionSignerNotFoundFailure());
}
