import 'package:encrypt/encrypt.dart';
import 'package:transaction_signing_gateway/encrypt/cipher.dart';

class AESCipher implements Cipher {
  @override
  String decrypt({required String password, required String encryptedData}) {
    final bundle = _EncryptedBundle.fromString(encryptedData);
    if (bundle == null) {
      throw ArgumentError("encrypted data has wrong format");
    }
    final encrypter = _fromPassword(password: password, salt: bundle.salt);
    return encrypter.decrypt(
      Encrypted.fromBase64(bundle.encryptedData),
      iv: IV.fromBase64(bundle.iv),
    );
  }

  @override
  String encrypt({required String password, required String data}) {
    final iv = _iv();
    final salt = _salt();
    final encrypter = _fromPassword(password: password, salt: salt);
    return _EncryptedBundle(
      iv: iv.base64,
      salt: salt,
      encryptedData: encrypter.encrypt(data, iv: iv).base64,
    ).string;
  }

  IV _iv() => IV.fromSecureRandom(16);

  String _salt() => IV.fromSecureRandom(32).base64;

  Encrypter _fromPassword({required String password, required String salt}) {
    final key = Key.fromUtf8(password).stretch(32, salt: IV.fromBase64(salt).bytes);
    return Encrypter(AES(key));
  }
}

class _EncryptedBundle {
  static const _delimiter = "|";
  final String iv;
  final String salt;
  final String encryptedData;

  _EncryptedBundle({
    required this.iv,
    required this.salt,
    required this.encryptedData,
  });

  static _EncryptedBundle? fromString(String str) {
    final split = str.split(_delimiter);
    if (split.length != 3) {
      return null;
    } else {
      return _EncryptedBundle(iv: split[0], salt: split[1], encryptedData: split[2]);
    }
  }

  String get string => "$iv$_delimiter$salt$_delimiter$encryptedData";
}
