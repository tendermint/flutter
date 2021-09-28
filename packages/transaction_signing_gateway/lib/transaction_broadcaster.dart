import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/signed_transaction.dart';
import 'package:transaction_signing_gateway/model/transaction_broadcasting_failure.dart';
import 'package:transaction_signing_gateway/model/transaction_hash.dart';

abstract class TransactionBroadcaster {
  Future<Either<TransactionBroadcastingFailure, TransactionHash>> broadcast({
    required SignedTransaction transaction,
    required PrivateWalletCredentials privateWalletCredentials,
  });

  bool canBroadcast(SignedTransaction signedTransaction);
}

class NotFoundBroadcaster implements TransactionBroadcaster {
  @override
  Future<Either<TransactionBroadcastingFailure, TransactionHash>> broadcast({
    required SignedTransaction transaction,
    required PrivateWalletCredentials privateWalletCredentials,
  }) async =>
      left(TransactionBroadcasterNotFoundFailure());

  @override
  bool canBroadcast(SignedTransaction signedTransaction) => true;
}
