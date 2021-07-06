import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/model/unsigned_transaction.dart';
import 'package:transaction_signing_gateway/transaction_summary_ui.dart';

typedef TransactionUIShower = Future<Either<TransactionSigningFailure, Unit>> Function(UnsignedTransaction);

class TransactionSummaryUIMock extends Mock implements TransactionSummaryUI {
  @override
  Future<Either<TransactionSigningFailure, Unit>> showTransactionSummaryUI({
    required UnsignedTransaction? transaction,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #showTransactionSummaryUI,
          [],
          {#transaction: transaction},
        ),
        returnValue:
            Future<Either<TransactionSigningFailure, Unit>>.value(left(const TransactionSignerNotFoundFailure())),
      ) as Future<Either<TransactionSigningFailure, Unit>>;
}
