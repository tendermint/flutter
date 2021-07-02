import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/signed_transaction.dart';
import 'package:transaction_signing_gateway/signing_gateway.dart';
import 'package:transaction_signing_gateway/transaction_signing_failure.dart';

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
