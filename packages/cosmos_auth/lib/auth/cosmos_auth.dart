import 'package:cosmos_auth/cosmos_auth.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:dartz/dartz.dart';

class CosmosAuth {
  CosmosAuth({
    Biometrics? biometrics,
    PasswordStore? passwordStore,
  })  : _biometrics = biometrics ?? const Biometrics(),
        _passwordStore = passwordStore ?? const PasswordStore();

  final Biometrics _biometrics;
  final PasswordStore _passwordStore;

  /// Gets available biometrics sensors list
  Future<Either<LocalAuthFailure, List<BiometricType>>> getAvailableBiometrics() =>
      _biometrics.getAvailableBiometrics();

  /// Triggers biometric authentication in the system. returns [LocalAuthFailure] in case of an error
  /// or if the device is not capable of biometric auth.
  Future<Either<LocalAuthFailure, bool>> biometricAuthenticate({
    String reason = "We want to make sure you're the owner of the device in order to secure your wallet data",
    bool biometricsOnly = false,
  }) async =>
      _biometrics.authenticate(reason: reason, biometricsOnly: biometricsOnly);

  /// saves the password in secureStore
  Future<Either<SavePasswordFailure, Unit>> savePassword({
    required SecureDataStore secureDataStore,
    required String id,
    required String password,
  }) =>
      _passwordStore.savePassword(
        secureDataStore: secureDataStore,
        id: id,
        password: password,
      );

  /// reads the password from secureStore, asks for biometric authentication beforehand.
  Future<Either<ReadPasswordFailure, String?>> readPassword({
    required SecureDataStore secureDataStore,
    required String id,
    bool useBiometrics = true,
  }) =>
      _passwordStore.readPassword(
        biometrics: _biometrics,
        secureDataStore: secureDataStore,
        useBiometrics: useBiometrics,
        id: id,
      );

  /// checks whether there is a password with the given [id] saved in secureStore
  Future<Either<ReadPasswordFailure, bool>> hasPassword({
    required SecureDataStore secureDataStore,
    required String id,
  }) =>
      _passwordStore.hasPassword(secureDataStore: secureDataStore, id: id);
}
