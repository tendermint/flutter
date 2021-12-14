import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/storage/data_store.dart';

class FlutterSecureStorageDataStore implements SecureDataStore {
  FlutterSecureStorageDataStore({
    FlutterSecureStorage? storage,
  }) : _store = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _store;

  @override
  Future<Either<CredentialsStorageFailure, String?>> readSecureText({required String key}) async {
    try {
      return right(
        await _store.read(
          key: key,
          iOptions: const IOSOptions(accessibility: IOSAccessibility.passcode),
          aOptions: const AndroidOptions(encryptedSharedPreferences: true),
        ),
      );
    } catch (ex, stack) {
      return left(CredentialsStorageFailure("Could not retrieve secure text for key '$key'", cause: ex, stack: stack));
    }
  }

  @override
  Future<Either<CredentialsStorageFailure, Unit>> saveSecureText({required String key, required String? value}) async {
    try {
      await _store.write(
        key: key,
        value: value,
        iOptions: const IOSOptions(accessibility: IOSAccessibility.passcode),
        aOptions: const AndroidOptions(encryptedSharedPreferences: true),
      );
      return right(unit);
    } catch (ex, stack) {
      return left(CredentialsStorageFailure("Could not write secure text for key '$key'", cause: ex, stack: stack));
    }
  }
}
