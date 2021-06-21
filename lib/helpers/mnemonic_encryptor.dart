import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';

abstract class MnemonicEncryptor {
  static Future<void> encryptMnemonic(String mnemonic, String password) async {
    final encrypter = _generateEncrypter(password);
    final encrypted = encrypter.encrypt(mnemonic, iv: IV.fromLength(16));

    final prefs = await SharedPreferences.getInstance();

    if (foundation.kIsWeb) {
      await prefs.setString(SharedPreferencesKeys.encryptedMnemonic, encrypted.base64);
    } else {
      const storage = FlutterSecureStorage();

      await storage.write(key: SharedPreferencesKeys.encryptedMnemonic, value: encrypted.base64);
    }

    await prefs.setBool(SharedPreferencesKeys.isWalletCreated, true);
  }

  static Future<String> decryptMnemonic(String password) async {
    final encrypter = _generateEncrypter(password);
    const storage = FlutterSecureStorage();

    String? value = '';

    if (foundation.kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      value = prefs.getString(SharedPreferencesKeys.encryptedMnemonic);
    } else {
      value = await storage.read(key: SharedPreferencesKeys.encryptedMnemonic);
    }
    var decrypted = '';

    if (value != null) {
      decrypted = encrypter.decrypt(Encrypted.fromBase64(value), iv: IV.fromLength(16));
    }

    return decrypted;
  }

  static Encrypter _generateEncrypter(String password) {
    final key = Key.fromUtf8(password);
    final salt = Uint8List(16);
    final stretchedKey = key.stretch(32, salt: salt);

    final encrypter = Encrypter(AES(stretchedKey));
    return encrypter;
  }
}
