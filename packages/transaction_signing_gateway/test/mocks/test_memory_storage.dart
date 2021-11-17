import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/storage/data_store.dart';

class TestPlainStore implements PlainDataStore {
  @override
  Future<Either<CredentialsStorageFailure, Map<String, String?>>> readAllPlainText() {
    // TODO: implement readAllPlainText
    throw UnimplementedError();
  }

  @override
  Future<Either<CredentialsStorageFailure, String?>> readPlainText({required String key}) {
    // TODO: implement readPlainText
    throw UnimplementedError();
  }

  @override
  Future<Either<CredentialsStorageFailure, Unit>> savePlainText({required String key, required String? value}) {
    // TODO: implement savePlainText
    throw UnimplementedError();
  }
}

class TestSecureStore implements SecureDataStore {
  @override
  Future<Either<CredentialsStorageFailure, String?>> readSecureText({required String key}) {
    // TODO: implement readSecureText
    throw UnimplementedError();
  }

  @override
  Future<Either<CredentialsStorageFailure, Unit>> saveSecureText({required String key, required String? value}) {
    // TODO: implement saveSecureText
    throw UnimplementedError();
  }
}
