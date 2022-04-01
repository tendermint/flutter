import 'package:cosmos_auth/cosmos_auth.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class StubSecureDataStore implements SecureDataStore {
  Map<String, String> map = {};

  @override
  Future<Either<CredentialsStorageFailure, bool>> clearAllData() async {
    map.clear();
    return right(true);
  }

  @override
  Future<Either<CredentialsStorageFailure, String?>> readSecureText({
    required String key,
  }) async =>
      right(map[key]);

  @override
  Future<Either<CredentialsStorageFailure, Unit>> saveSecureText({
    required String key,
    required String? value,
  }) async {
    if (value == null) {
      map.remove(key);
    } else {
      map[key] = value;
    }
    return right(unit);
  }
}

class MockBiometrics extends Mock implements Biometrics {
  void mockAuthenticate({
    required Either<LocalAuthFailure, bool> result,
  }) {
    when(
      () => authenticate(
        reason: any(named: 'reason'),
        biometricsOnly: any(named: 'biometricsOnly'),
      ),
    ).thenAnswer((invocation) async => result);
  }
}

class MockPasswordStore extends Mock implements PasswordStore {}
