import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/future_either.dart';
import 'package:transaction_signing_gateway/key_info_storage.dart';
import 'package:transaction_signing_gateway/signed_transaction.dart';
import 'package:transaction_signing_gateway/transaction_signer.dart';
import 'package:transaction_signing_gateway/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/transaction_summary_ui.dart';
import 'package:transaction_signing_gateway/unsigned_transaction.dart';

class TransactionSigningGateway {
  final List<TransactionSigner> _signers;
  final KeyInfoStorage _infoStorage;
  final TransactionSummaryUI _transactionSummaryUI;

  TransactionSigningGateway({
    required List<TransactionSigner> signers,
    required KeyInfoStorage infoStorage,
    required TransactionSummaryUI transactionSummaryUI,
  })  : _signers = List.unmodifiable(signers),
        _infoStorage = infoStorage,
        _transactionSummaryUI = transactionSummaryUI;

  Future<Either<TransactionSigningFailure, SignedTransaction>> signTransaction({
    required UnsignedTransaction transaction,
  }) async =>
      _transactionSummaryUI
          .showTransactionSummaryUI(transaction: transaction)
          .flatMap((userAccepted) => _infoStorage.getPrivateCredentials())
          .flatMap((privateCreds) async => _findCapableSigner(transaction).sign(
                privateCredentials: privateCreds,
                transaction: transaction,
              ));

  TransactionSigner _findCapableSigner(UnsignedTransaction transaction) => _signers.firstWhere(
        (element) => element.canSign(transaction),
        orElse: () => NotFoundTransactionSigner(),
      );
}
