import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';

enum TransactionSigningFailType {
  userDeclined,
  invalidPassword,
  noTransactionSignerFound,
  walletCredentialsStorageFailure,
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

class StorageProblemSigningFailure implements TransactionSigningFailure {
  final CredentialsStorageFailure failure;
  @override
  TransactionSigningFailType get type => throw TransactionSigningFailType.walletCredentialsStorageFailure;

  const StorageProblemSigningFailure(this.failure);

  @override
  String toString() {
    return 'StorageProblemSigningFailure{fail: $failure}';
  }
}
