import 'package:bip39/bip39.dart' as bip39;

abstract class MnemonicGenerator {
  static String generateMnemonic() => bip39.generateMnemonic(strength: 256);
}