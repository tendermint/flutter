import 'package:cosmos_auth/auth/model/local_auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:local_auth/local_auth.dart';

class CosmosAuth {
  /// Triggers biometric authentication in the system. returns [LocalAuthFailure] in case of an error
  /// or if the device is not capable of biometric auth.
  Future<Either<LocalAuthFailure, bool>> biometricAuthenticate({
    String reason = "We want to make sure you're the owner of the device in order to secure your wallet data",
    bool biometricsOnly = false,
  }) async {
    final localAuth = LocalAuthentication();
    if (await localAuth.canCheckBiometrics) {
      final result = await localAuth.authenticate(
        localizedReason: reason,
        biometricOnly: biometricsOnly,
      );
      return right(result);
    } else {
      return left(const LocalAuthFailure.noBiometricsAvailable());
    }
  }
}
