import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';

abstract class PlainDataStore {

  Future<Either<CredentialsStorageFailure, Unit>> savePlainText({
    required String key,
    required String? value,
  });

  Future<Either<CredentialsStorageFailure, String?>> readPlainText({
    required String key,
  });

  Future<Either<CredentialsStorageFailure, Map<String, String?>>> readAllPlainText();
}

abstract class SecureDataStore {
  Future<Either<CredentialsStorageFailure, Unit>> saveSecureText({
    required String key,
    required String? value,
  });

  Future<Either<CredentialsStorageFailure, String?>> readSecureText({
    required String key,
  });
}
