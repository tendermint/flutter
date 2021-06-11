import 'package:encrypt/encrypt.dart';
import 'package:flutter_app/helpers/mnemonic_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Encryption test', () {
    var password = 'ThisIsMyPassword0987!@#\$';
    final mnemonic = MnemonicGenerator.generateMnemonic();
    final key = Key.fromUtf8(password);
    final iv = IV.fromLength(16);

    print('Generated Mnemonic');
    print(mnemonic);

    print('Password');
    print(password);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(mnemonic, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print('Encrypted Mnemonic');
    print(encrypted.base64);
//    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  });
}