import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/signed_transaction.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

abstract class TransactionSigner {
  /// Signs the passed-in [UnsignedTransaction].
  ///
  /// Returns [SignedTransaction] on successful sign, or [TransactionSigningFailure] otherwise.
  Future<Either<TransactionSigningFailure, SignedTransaction>> sign({
    required PrivateWalletCredentials privateCredentials,
    required UnsignedTransaction transaction,
  });

  /// Checks if passed in transaction can be signed by this [TransactionSigner].
  ///
  /// At least a type check should be performed on the passed transaction to determine if this is transaction meant
  /// for this signer, for example: `return unsignedTransaction is SaccoTransaction`
  bool canSign(UnsignedTransaction unsignedTransaction);
}

/// Default implementation for cases where given transaction could not be matched with any of the registered signers
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
