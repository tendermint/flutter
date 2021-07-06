import 'package:encrypt/encrypt.dart';
import 'package:transaction_signing_gateway/encrypt/cipher.dart';

class AESCipher implements Cipher {
  @override
  String decrypt({required String password, required String encryptedData}) {
    final encrypter = _fromPassword(password);
    final bundle = _EncryptedBundle.fromString(encryptedData);
    if (bundle == null) {
      throw ArgumentError("encrypted data has wrong format");
    }
    return encrypter.decrypt(
      Encrypted.fromBase64(bundle.encryptedData),
      iv: IV.fromBase64(bundle.iv),
    );
  }

  @override
  String encrypt({required String password, required String data}) {
    final encrypter = _fromPassword(password);
    final iv = _iv();
    return _EncryptedBundle(
      iv: iv.base64,
      encryptedData: encrypter.encrypt(data, iv: iv).base64,
    ).string;
  }

  IV _iv() => IV.fromSecureRandom(16);

  Encrypter _fromPassword(String password) {
    final key = Key.fromUtf8(password).stretch(32, salt: IV.fromLength(32).bytes);
    return Encrypter(AES(key));
  }
}

class _EncryptedBundle {
  static const _delimiter = "|";
  final String iv;
  final String encryptedData;

  _EncryptedBundle({
    required this.iv,
    required this.encryptedData,
  });

  static _EncryptedBundle? fromString(String str) {
    final split = str.split(_delimiter);
    if (split.length != 2) {
      return null;
    } else {
      return _EncryptedBundle(iv: split[0], encryptedData: split[1]);
    }
  }

  String get string => "$iv$_delimiter$encryptedData";
}
