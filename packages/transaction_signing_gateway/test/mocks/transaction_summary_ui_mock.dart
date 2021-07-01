import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/transaction_summary_ui.dart';
import 'package:transaction_signing_gateway/unsigned_transaction.dart';

typedef TransactionUIShower = Future<Either<TransactionSigningFailure, Unit>> Function(UnsignedTransaction);

class TransactionSummaryUIMock implements TransactionSummaryUI {
  TransactionUIShower summaryUIShower;

  TransactionSummaryUIMock({
    TransactionUIShower? summaryUIShower,
  }) : summaryUIShower = summaryUIShower ?? ((_) async => left(const UserDeclinedTransactionSignerFailure()));

  @override
  Future<Either<TransactionSigningFailure, Unit>> showTransactionSummaryUI({
    required UnsignedTransaction transaction,
  }) =>
      summaryUIShower(transaction);
}
