enum AccountDerivationFailureType {
  Unknown,
  InvalidMnemonic,
}

class AccountDerivationFailure {
  const AccountDerivationFailure.unknown({this.cause}) : type = AccountDerivationFailureType.Unknown;

  const AccountDerivationFailure.invalidMnemonic({this.cause}) : type = AccountDerivationFailureType.InvalidMnemonic;

  final AccountDerivationFailureType type;
  final Object? cause;

  @override
  String toString() {
    return 'AccountDerivationFailure{type: $type, cause: $cause}';
  }
}
