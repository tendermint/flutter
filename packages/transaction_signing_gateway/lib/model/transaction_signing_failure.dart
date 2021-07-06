enum TransactionSigningFailType {
  userDeclined,
  invalidPassword,
  noTransactionSignerFound,
  walletCredentialsRetrievalFailure,
  unknown,
}

abstract class TransactionSigningFailure {
  TransactionSigningFailType get type;
}

class TransactionSignerNotFoundFailure implements TransactionSigningFailure {
  @override
  TransactionSigningFailType get type => TransactionSigningFailType.noTransactionSignerFound;

  const TransactionSignerNotFoundFailure();
}

class UserDeclinedTransactionSignerFailure implements TransactionSigningFailure {
  @override
  TransactionSigningFailType get type => TransactionSigningFailType.userDeclined;

  const UserDeclinedTransactionSignerFailure();
}

class InvalidPasswordTransactionSignerFailure implements TransactionSigningFailure {
  @override
  TransactionSigningFailType get type => TransactionSigningFailType.invalidPassword;

  const InvalidPasswordTransactionSignerFailure();
}

class WalletCredentialsRetrievalFailure implements TransactionSigningFailure {
  final String message;
  @override
  TransactionSigningFailType get type => throw TransactionSigningFailType.walletCredentialsRetrievalFailure;

  const WalletCredentialsRetrievalFailure(this.message);

  @override
  String toString() {
    return 'WalletCredentialsRetrievalFailure{message: $message}';
  }
}
