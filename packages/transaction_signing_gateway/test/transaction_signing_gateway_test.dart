import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transaction_signing_gateway/signing_gateway.dart';
import 'package:transaction_signing_gateway/transaction_signing_failure.dart';

import 'mocks/key_info_storage_mock.dart';
import 'mocks/transaction_summary_ui_mock.dart';

void main() {
  group("Mock TransactionSummary", () {
    late TransactionSummaryUIMock summaryUI;
    late KeyInfoStorageMock infoStorage;
    late TransactionSigningGateway signingGateway;

    test("declining ui returns failure", () async {
      // GIVEN
      summaryUI.summaryUIShower = (_) async => left(const UserDeclinedTransactionSignerFailure());
      // WHEN
      final result = await signingGateway.signTransaction(transaction: UnsignedTransaction());
      // THEN
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<UserDeclinedTransactionSignerFailure>());
    });

    setUp(() {
      summaryUI = TransactionSummaryUIMock();
      infoStorage = KeyInfoStorageMock();
      signingGateway = TransactionSigningGateway(
        transactionSummaryUI: summaryUI,
        signers: [],
        infoStorage: infoStorage,
      );
    });
  });
}
