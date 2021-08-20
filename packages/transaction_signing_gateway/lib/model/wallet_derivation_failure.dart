enum WalletDerivationFailType {
  invalidMnemonic,
  derivatorNotFound,
  unknown,
}

abstract class WalletDerivationFailure {
  WalletDerivationFailType get type;
}

class InvalidMnemonicFailure implements WalletDerivationFailure {
  final Object failure;

  @override
  WalletDerivationFailType get type => WalletDerivationFailType.invalidMnemonic;

  const InvalidMnemonicFailure(this.failure);

  @override
  String toString() => 'InvalidMnemonicFailure{fail: $failure}';
}

class DerivatorNotFoundFailure implements WalletDerivationFailure {
  @override
  WalletDerivationFailType get type => WalletDerivationFailType.derivatorNotFound;

  const DerivatorNotFoundFailure();

  @override
  String toString() => 'DerivatorNotFoundFailure';
}

class UnknownNotFoundFailure implements WalletDerivationFailure {
  final Object failure;

  @override
  WalletDerivationFailType get type => WalletDerivationFailType.unknown;

  const UnknownNotFoundFailure(this.failure);

  @override
  String toString() => 'UnknownNotFoundFailure{fail: $failure}';
}
