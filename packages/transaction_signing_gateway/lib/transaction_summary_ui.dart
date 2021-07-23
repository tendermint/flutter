import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/model/unsigned_transaction.dart';

abstract class TransactionSummaryUI {
  /// Shows a summary of the transaction for the user to approve.
  ///
  /// Implementations of this method should display a summary of the transaction that is about to be signed.
  /// It should allow the user to review all the relevant details and present him with options to either approve
  /// or decline the transaction. If user declines the transaction returned future should exit with
  /// `left(UserDeclinedTransactionSignerFailure)`, otherwise a `right(unit)` denotes a success.
  Future<Either<TransactionSigningFailure, Unit>> showTransactionSummaryUI({
    required UnsignedTransaction transaction,
  });
}
