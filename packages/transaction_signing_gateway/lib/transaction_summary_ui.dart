import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/unsigned_transaction.dart';

abstract class TransactionSummaryUI {
  Future<Either<TransactionSigningFailure, Unit>> showTransactionSummaryUI({
    required UnsignedTransaction transaction,
  });
}
