enum WalletDerivationFailType {
  invalidMnemonic,
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
  String toString() {
    return 'InvalidMnemonicFailure{fail: $failure}';
  }
}
