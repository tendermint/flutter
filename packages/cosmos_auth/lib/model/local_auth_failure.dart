enum LocalAuthFailureType {
  noBiometrics,
  unknown,
}

class LocalAuthFailure {
  LocalAuthFailure(this.type);

  const LocalAuthFailure.noBiometricsAvailable() : type = LocalAuthFailureType.noBiometrics;

  const LocalAuthFailure.unknown() : type = LocalAuthFailureType.unknown;

  final LocalAuthFailureType type;
}
