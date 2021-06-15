import 'package:flutter_app/helpers/mnemonic_encryptor.dart';
import 'package:flutter_app/helpers/mnemonic_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var mnemonic = MnemonicGenerator.generateMnemonic();
  test('Encryption test', () {
    var password = 'Hello123';
    MnemonicEncryptor.encryptMnemonic(mnemonic, password);
  });

  test('Decryption test', () async {
    var password = 'Hello123';
    print(await MnemonicEncryptor.decryptMnemonic(password));
  });
}
