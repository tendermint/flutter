enum WalletDerivationFailType {
  invalidMnemonic,
  derivatorNotFound,
  unknown,
}

abstract class WalletDerivationFailure {
  WalletDerivationFailType get type;
}

class InvalidMnemonicFailure implements WalletDerivationFailure {
  const InvalidMnemonicFailure(this.failure);

  final Object failure;

  @override
  WalletDerivationFailType get type => WalletDerivationFailType.invalidMnemonic;

  @override
  String toString() => 'InvalidMnemonicFailure{fail: $failure}';
}

class DerivatorNotFoundFailure implements WalletDerivationFailure {
  const DerivatorNotFoundFailure();

  @override
  WalletDerivationFailType get type => WalletDerivationFailType.derivatorNotFound;

  @override
  String toString() => 'DerivatorNotFoundFailure';
}

class UnknownNotFoundFailure implements WalletDerivationFailure {
  const UnknownNotFoundFailure(this.failure);

  final Object failure;

  @override
  WalletDerivationFailType get type => WalletDerivationFailType.unknown;

  @override
  String toString() => 'UnknownNotFoundFailure{fail: $failure}';
}
