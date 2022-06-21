import 'package:bip39/bip39.dart' as bip39;
import 'package:cosmos_utils/cosmos_utils.dart';

enum MnemonicLength {
  words12,
  words24,
}

class Mnemonic {
  const Mnemonic(this.value);

  Mnemonic.fromWords(List<String> words) : this(words.join(' '));

  static Future<Mnemonic> generate(MnemonicLength length) async {
    switch (length) {
      case MnemonicLength.words12:
        return Mnemonic(await generateMnemonic(strength: 128));
      case MnemonicLength.words24:
        return Mnemonic(await generateMnemonic());
    }
  }

  final String value;

  List<String> get words => value.splitToWords();

  bool isValid() => bip39.validateMnemonic(value);
}
