import 'package:cosmos_auth/model/biometric_type.dart' as model;
import 'package:cosmos_auth/model/local_auth_failure.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:local_auth/local_auth.dart';

class Biometrics {
  const Biometrics();

  Future<Either<LocalAuthFailure, bool>> authenticate({
    String reason = "We want to make sure you're the owner of the device in order to secure your wallet data",
    bool biometricsOnly = false,
  }) async {
    try {
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
    } catch (ex, stack) {
      logError(ex, stack);
      return left(LocalAuthFailure.unknown(ex, stack));
    }
  }

  Future<Either<LocalAuthFailure, List<model.BiometricType>>> getAvailableBiometrics() async {
    try {
      final biometrics = await LocalAuthentication().getAvailableBiometrics();
      return right(biometrics.map(_biometricTypeFromLocalAuth).toList());
    } catch (ex, stack) {
      logError(ex, stack);
      return left(LocalAuthFailure.unknown(ex, stack));
    }
  }
}

model.BiometricType _biometricTypeFromLocalAuth(BiometricType type) {
  switch (type) {
    case BiometricType.face:
      return model.BiometricType.face;
    case BiometricType.fingerprint:
      return model.BiometricType.fingerprint;
    case BiometricType.iris:
      return model.BiometricType.iris;
  }
}
