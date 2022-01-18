import 'package:cosmos_utils/credentials_storage_failure.dart';

enum ReadPasswordFailureType {
  Unknown,
  AuthenticationFailed,
  SecureStorageFail,
}

class ReadPasswordFailure {
  const ReadPasswordFailure.unknown([
    this.cause,
    this.stack,
  ]) : type = ReadPasswordFailureType.Unknown;

  const ReadPasswordFailure.authenticationFailed([
    this.cause,
    this.stack,
  ]) : type = ReadPasswordFailureType.AuthenticationFailed;

  const ReadPasswordFailure.secureStorageFailure(
    CredentialsStorageFailure fail, [
    this.stack,
  ])  : cause = fail,
        type = ReadPasswordFailureType.SecureStorageFail;

  final ReadPasswordFailureType type;
  final Object? cause;
  final dynamic stack;
}
