import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:transaction_signing_gateway/private_wallet_credentials.dart';
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
      when(summaryUI.showTransactionSummaryUI(transaction: anyNamed("transaction")))
          .thenAnswer((_) async => left(const UserDeclinedTransactionSignerFailure()));
      // WHEN
      final result = await signingGateway.signTransaction(transaction: UnsignedTransaction());
      // THEN
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<UserDeclinedTransactionSignerFailure>());
      verifyNever(infoStorage.getPrivateCredentials());
    });

    test("failing to retrieve key returns failure", () async {
      // GIVEN
      when(summaryUI.showTransactionSummaryUI(transaction: anyNamed("transaction")))
          .thenAnswer((_) async => right(unit));
      when(infoStorage.getPrivateCredentials())
          .thenAnswer((_) async => left(const WalletCredentialsRetrievalFailure()));
      // WHEN
      final result = await signingGateway.signTransaction(transaction: UnsignedTransaction());
      // THEN
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<WalletCredentialsRetrievalFailure>());
      verify(summaryUI.showTransactionSummaryUI(transaction: anyNamed("transaction")));
    });

    test("missing proper signer returns failure", () async {
      // GIVEN
      when(summaryUI.showTransactionSummaryUI(transaction: anyNamed("transaction")))
          .thenAnswer((_) async => right(unit));
      when(infoStorage.getPrivateCredentials()).thenAnswer((_) async => right(PrivateWalletCredentials()));
      // WHEN
      final result = await signingGateway.signTransaction(transaction: UnsignedTransaction());
      // THEN
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<TransactionSignerNotFoundFailure>());
      verify(summaryUI.showTransactionSummaryUI(transaction: anyNamed("transaction")));
      verify(infoStorage.getPrivateCredentials());
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
