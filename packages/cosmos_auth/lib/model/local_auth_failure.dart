enum LocalAuthFailureType {
  noBiometrics,
  unknown,
}

class LocalAuthFailure {
  const LocalAuthFailure.noBiometricsAvailable([this.cause, this.stack])
      : type = LocalAuthFailureType.noBiometrics;

  const LocalAuthFailure.unknown([this.cause, this.stack])
      : type = LocalAuthFailureType.unknown;

  final LocalAuthFailureType type;
  final dynamic cause;
  final dynamic stack;

  @override
  String toString() {
    return 'LocalAuthFailure{type: $type, cause: $cause,\nstack: $stack}';
  }
}
