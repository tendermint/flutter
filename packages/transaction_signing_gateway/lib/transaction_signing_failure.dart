enum TransactionSigningFailType {
  userDeclined,
  noTransactionSignerFound,
  walletCredentialsRetrievalFailure,
  unknown,
}

abstract class TransactionSigningFailure {
  TransactionSigningFailType get type;
}

class NotFoundTransactionSignerFailure implements TransactionSigningFailure {
  @override
  TransactionSigningFailType get type => TransactionSigningFailType.noTransactionSignerFound;

  const NotFoundTransactionSignerFailure();
}

class UserDeclinedTransactionSignerFailure implements TransactionSigningFailure {
  @override
  TransactionSigningFailType get type => TransactionSigningFailType.userDeclined;

  const UserDeclinedTransactionSignerFailure();
}

class WalletCredentialsRetrievalFailure implements TransactionSigningFailure {
  @override
  TransactionSigningFailType get type => throw TransactionSigningFailType.walletCredentialsRetrievalFailure;

  const WalletCredentialsRetrievalFailure();
}
