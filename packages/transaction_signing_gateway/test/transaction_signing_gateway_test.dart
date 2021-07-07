import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

import 'mocks/key_info_storage_mock.dart';
import 'mocks/private_wallet_credentials_mock.dart';
import 'mocks/transaction_summary_ui_mock.dart';

void main() {
  group("Mock TransactionSummary", () {
    late TransactionSummaryUIMock summaryUI;
    late KeyInfoStorageMock infoStorage;
    late TransactionSigningGateway signingGateway;
    const chainId = "atom";
    const walletId = "123walletId";
    const mnemonic =
        "fruit talent run shallow police ripple wheat original cabbage vendor tilt income gasp meat acid annual armed system target great oxygen artist net elegant";
    const privateCredsStub = PrivateWalletCredentialsMock(
      chainId: chainId,
      walletId: walletId,
      mnemonic: mnemonic,
    );

    test("declining ui returns failure", () async {
      // GIVEN
      when(summaryUI.showTransactionSummaryUI(transaction: anyNamed("transaction")))
          .thenAnswer((_) async => left(const UserDeclinedTransactionSignerFailure()));
      // WHEN
      final result = await signingGateway.signTransaction(
        transaction: UnsignedTransaction(),
        chainId: chainId,
        password: "password",
        walletId: walletId,
      );
      // THEN
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<UserDeclinedTransactionSignerFailure>());
      verifyNever(infoStorage.getPrivateCredentials(
        chainId: anyNamed("chainId"),
        walletId: anyNamed("walletId"),
        password: anyNamed("password"),
      ));
    });

    test("failing to retrieve key returns failure", () async {
      // GIVEN
      when(summaryUI.showTransactionSummaryUI(transaction: anyNamed("transaction")))
          .thenAnswer((_) async => right(unit));
      when(infoStorage.getPrivateCredentials(
        chainId: anyNamed("chainId"),
        walletId: anyNamed("walletId"),
        password: anyNamed("password"),
      )).thenAnswer((_) async => left(const WalletCredentialsRetrievalFailure("fail")));
      // WHEN
      final result = await signingGateway.signTransaction(
        transaction: UnsignedTransaction(),
        chainId: chainId,
        password: "password",
        walletId: walletId,
      );
      // THEN
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<WalletCredentialsRetrievalFailure>());
      verify(summaryUI.showTransactionSummaryUI(transaction: anyNamed("transaction")));
    });

    test("missing proper signer returns failure", () async {
      // GIVEN
      when(summaryUI.showTransactionSummaryUI(transaction: anyNamed("transaction")))
          .thenAnswer((_) async => right(unit));
      when(infoStorage.getPrivateCredentials(
        chainId: anyNamed("chainId"),
        walletId: anyNamed("walletId"),
        password: anyNamed("password"),
      )).thenAnswer((_) async => right(privateCredsStub));
      // WHEN
      final result = await signingGateway.signTransaction(
        transaction: UnsignedTransaction(),
        chainId: chainId,
        password: "password",
        walletId: walletId,
      );
      // THEN
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<TransactionSignerNotFoundFailure>());
      verify(summaryUI.showTransactionSummaryUI(transaction: anyNamed("transaction")));
      verify(infoStorage.getPrivateCredentials(
        chainId: anyNamed("chainId"),
        walletId: anyNamed("walletId"),
        password: anyNamed("password"),
      ));
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
