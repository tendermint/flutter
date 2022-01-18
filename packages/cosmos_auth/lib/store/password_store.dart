import 'package:cosmos_auth/cosmos_auth.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:dartz/dartz.dart';

class PasswordStore {
  const PasswordStore();

  Future<Either<ReadPasswordFailure, String?>> readPassword({
    required Biometrics biometrics,
    required SecureDataStore secureDataStore,
    required String id,
    bool useBiometrics = true,
  }) async {
    Future<Either<ReadPasswordFailure, bool>> authentication;
    if (useBiometrics) {
      authentication = biometrics
          .authenticate() //
          .mapError((fail) => ReadPasswordFailure.authenticationFailed(fail));
    } else {
      authentication = Future.value(right(true));
    }
    return authentication.flatMap((authenticated) async {
      if (authenticated) {
        return secureDataStore
            .readSecureText(key: _passwordKey(id))
            .mapError((fail) => ReadPasswordFailure.secureStorageFailure(fail));
      } else {
        return left(const ReadPasswordFailure.authenticationFailed('User failed biometric authentication'));
      }
    });
  }

  Future<Either<SavePasswordFailure, Unit>> savePassword({
    required SecureDataStore secureDataStore,
    required String id,
    required String password,
  }) =>
      secureDataStore
          .saveSecureText(key: _passwordKey(id), value: password)
          .mapError((fail) => SavePasswordFailure.storageFailure(fail));

  Future<Either<ReadPasswordFailure, bool>> hasPassword({
    required SecureDataStore secureDataStore,
    required String id,
  }) =>
      secureDataStore
          .readSecureText(key: _passwordKey(id))
          .mapError((fail) => ReadPasswordFailure.secureStorageFailure(fail))
          .mapSuccess((secure) => secure != null);

  String _passwordKey(String id) => 'cosmos_pw_$id';
}
