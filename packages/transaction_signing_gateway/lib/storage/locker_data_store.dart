import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_locker/flutter_locker.dart';

class LockerDataStore implements SecureDataStore {
  LockerDataStore({
    this.androidPromptTitle = 'Authenticate',
    this.androidCancelAction = 'Cancel',
    this.iosPromptText = 'Authenticate',
  });

  final String androidPromptTitle;
  final String androidCancelAction;
  final String iosPromptText;

  @override
  Future<Either<CredentialsStorageFailure, String?>> readSecureText({
    required String key,
  }) async {
    try {
      final result = await FlutterLocker.retrieve(
        RetrieveSecretRequest(
          key,
          AndroidPrompt(androidPromptTitle, androidCancelAction),
          IOsPrompt(iosPromptText),
        ),
      );
      return right(result);
    } catch (ex, stack) {
      return left(CredentialsStorageFailure('Flutter locker error', cause: ex, stack: stack));
    }
  }

  @override
  Future<Either<CredentialsStorageFailure, Unit>> saveSecureText({
    required String key,
    required String? value,
  }) async {
    try {
      if (value == null) {
        await FlutterLocker.delete(key);
      } else {
        await FlutterLocker.save(SaveSecretRequest(key, value, AndroidPrompt(androidPromptTitle, androidCancelAction)));
      }

      return right(unit);
    } catch (ex, stack) {
      return left(CredentialsStorageFailure('Flutter locker error', cause: ex, stack: stack));
    }
  }
}
