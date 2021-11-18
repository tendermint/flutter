import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/storage/data_store.dart';

class SharedPrefsPlainDataStore implements PlainDataStore {
  @override
  Future<Either<CredentialsStorageFailure, Map<String, String?>>> readAllPlainText() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return right(
        Map.fromEntries(
          prefs.getKeys().map(
                (key) => MapEntry(
                  key,
                  prefs.getString(key),
                ),
              ),
        ),
      );
    } catch (ex, stack) {
      return left(CredentialsStorageFailure("Error while reading all plain text data", cause: ex, stack: stack));
    }
  }

  @override
  Future<Either<CredentialsStorageFailure, String?>> readPlainText({required String key}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return right(prefs.getString(key));
    } catch (ex, stack) {
      return left(CredentialsStorageFailure("Error while reading plain text for key: '$key'", cause: ex, stack: stack));
    }
  }

  @override
  Future<Either<CredentialsStorageFailure, Unit>> savePlainText({required String key, required String? value}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (value == null) {
        await prefs.remove(key);
      } else {
        await prefs.setString(key, value);
      }
      return right(unit);
    } catch (ex, stack) {
      return left(CredentialsStorageFailure("Error while setting plain text for key: '$key'", cause: ex, stack: stack));
    }
  }
}
