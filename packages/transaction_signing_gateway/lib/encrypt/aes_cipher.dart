import 'package:encrypt/encrypt.dart';
import 'package:transaction_signing_gateway/encrypt/cipher.dart';

class AESCipher implements Cipher {
  static const _saltLength = 8;

  @override
  String decrypt({required String password, required String encryptedData}) {
    final encrypter = _fromPassword(password + _extractSalt(encryptedData));
    return encrypter.decrypt(
      Encrypted.fromBase64(_extractEncryptedData(encryptedData)),
      iv: _iv(password),
    );
  }

  @override
  String encrypt({required String password, required String data}) {
    final salt = _generateSalt();
    final encrypter = _fromPassword(password + salt);

    return salt + encrypter.encrypt(data, iv: _iv(password)).base64;
  }

  IV _iv(String password) => IV.fromUtf8(password);

  Encrypter _fromPassword(String password) {
    final key = Key.fromUtf8(password).stretch(32, salt: IV.fromUtf8(password).bytes);
    return Encrypter(AES(key));
  }

  String _extractSalt(String data) {
    return data.substring(0, _saltLength);
  }

  String _extractEncryptedData(String data) {
    return data.substring(_saltLength);
  }

  String _generateSalt() => SecureRandom(_saltLength * 2).base64.substring(0, _saltLength);
}
