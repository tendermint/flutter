import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';

abstract class MnemonicEncryptor {
  static Future encryptMnemonic(String mnemonic, String password) async {
    // TODO: To be updated when we find some other encryption technique
    final key = Key.fromUtf8('htey45%#&YthtagastwfhHDG');
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(mnemonic, iv: iv);

    final storage = new FlutterSecureStorage();

    await storage.write(key: 'ENCRYPTED_MNEMONIC', value: encrypted.base64);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPreferencesKeys.isWalletCreated, true);
  }

  static Future<String> decryptMnemonic(String password) async {
    // TODO: To be updated when we find some other encryption technique
    final key = Key.fromUtf8('htey45%#&YthtagastwfhHDG');
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));
    final storage = new FlutterSecureStorage();
    String? value = await storage.read(key: 'ENCRYPTED_MNEMONIC');
    String decrypted = '';

    if (value != null) {
      decrypted = encrypter.decrypt(Encrypted.fromBase64(value), iv: iv);
    }

    return decrypted;
  }
}