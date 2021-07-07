import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:transaction_signing_gateway/encrypt/aes_cipher.dart';
import 'package:transaction_signing_gateway/encrypt/cipher.dart';
import 'package:transaction_signing_gateway/key_info_storage.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';

class MobileKeyInfoStorage implements KeyInfoStorage {
  final FlutterSecureStorage _storage;
  final Cipher _cipher;

  MobileKeyInfoStorage({FlutterSecureStorage? storage, Cipher? cipher})
      : _storage = storage ?? const FlutterSecureStorage(),
        _cipher = cipher ?? AESCipher();

  @override
  Future<Either<TransactionSigningFailure, PrivateWalletCredentials>> getPrivateCredentials({
    required String chainId,
    required String walletId,
    required String password,
  }) async {
    final encryptedData = await _storage.read(key: _key(chainId: chainId, walletId: walletId));
    if (encryptedData == null) {
      return left(
        WalletCredentialsRetrievalFailure("Cannot find credentials for chainId: $chainId and walletId: $walletId"),
      );
    }
    try {
      final decrypted = _cipher.decrypt(password: password, encryptedData: encryptedData);
      final json = await compute(jsonDecode, decrypted) as Map<String, dynamic>;
      final creds = PrivateWalletCredentials.fromJson(json);
      if (creds == null) {
        return left(const WalletCredentialsRetrievalFailure("Could not decode private wallet creds"));
      }
      return right(creds);
    } catch (error) {
      return left(const InvalidPasswordTransactionSignerFailure());
    }
  }

  String _key({required String chainId, required String walletId}) => "$chainId:$walletId";

  @override
  Future<Either<TransactionSigningFailure, Unit>> savePrivateCredentials({
    required PrivateWalletCredentials walletCredentials,
    required String password,
  }) async {
    final jsonString = await compute(jsonEncode, walletCredentials.toJson());
    try {
      final encrypted = _cipher.encrypt(
        password: password,
        data: jsonString,
      );
      final key = _key(
        chainId: walletCredentials.chainId,
        walletId: walletCredentials.walletId,
      );
      await _storage.write(key: key, value: encrypted);
      return right(unit);
    } catch (e) {
      return left(WalletCredentialsRetrievalFailure("$e"));
    }
  }
}
