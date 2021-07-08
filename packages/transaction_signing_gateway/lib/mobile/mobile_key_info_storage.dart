import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:transaction_signing_gateway/encrypt/aes_cipher.dart';
import 'package:transaction_signing_gateway/encrypt/cipher.dart';
import 'package:transaction_signing_gateway/key_info_storage.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials_serializer.dart';
import 'package:transaction_signing_gateway/utils/future_either.dart';

class MobileKeyInfoStorage implements KeyInfoStorage {
  final FlutterSecureStorage _storage;
  final Cipher _cipher;
  final List<PrivateWalletCredentialsSerializer> serializers;

  MobileKeyInfoStorage({
    required this.serializers,
    FlutterSecureStorage? storage,
    Cipher? cipher,
  })  : _storage = storage ?? const FlutterSecureStorage(),
        _cipher = cipher ?? AESCipher();

  @override
  Future<Either<CredentialsStorageFailure, PrivateWalletCredentials>> getPrivateCredentials({
    required String chainId,
    required String walletId,
    required String password,
  }) async {
    final encryptedData = await _storage.read(key: _credentialsKey(chainId: chainId, walletId: walletId));
    if (encryptedData == null) {
      return left(
        CredentialsStorageFailure("Cannot find credentials for chainId: $chainId and walletId: $walletId"),
      );
    }
    final serializer = await _findDeserializer(_serializerIdKey(chainId: chainId, walletId: walletId));
    if (serializer == null) {
      return left(
          CredentialsStorageFailure("Could not find proper deserializer for walletId: $walletId, chainId: $chainId"));
    }

    try {
      final decrypted = _cipher.decrypt(password: password, encryptedData: encryptedData);
      final json = await compute(jsonDecode, decrypted) as Map<String, dynamic>;
      return serializer.fromJson(json);
    } catch (error) {
      return left(const CredentialsStorageFailure("invalid password"));
    }
  }

  String _credentialsKey({required String chainId, required String walletId}) => "$chainId:$walletId";

  String _serializerIdKey({required String chainId, required String walletId}) => "$chainId:$walletId:serializer";

  @override
  Future<Either<CredentialsStorageFailure, Unit>> savePrivateCredentials({
    required PrivateWalletCredentials walletCredentials,
    required String password,
  }) async {
    final serializer = _findSerializer(walletCredentials);
    if (serializer == null) {
      return left(
        CredentialsStorageFailure("Could not find proper serializer for ${walletCredentials.runtimeType}"),
      );
    }
    final credsKey = _credentialsKey(
      chainId: walletCredentials.chainId,
      walletId: walletCredentials.walletId,
    );
    final serializerKey = _serializerIdKey(
      chainId: walletCredentials.chainId,
      walletId: walletCredentials.walletId,
    );
    return Future.value(serializer.toJson(walletCredentials))
        .flatMap((jsonMap) async => right(await compute(jsonEncode, jsonMap)))
        .flatMap(
      (jsonString) async {
        try {
          final encrypted = _cipher.encrypt(password: password, data: jsonString);
          await _storage.write(key: credsKey, value: encrypted);
          await _storage.write(key: serializerKey, value: walletCredentials.serializerIdentifier);
          return right(unit);
        } catch (e) {
          return left(CredentialsStorageFailure("$e"));
        }
      },
    );
  }

  Future<PrivateWalletCredentialsSerializer?> _findDeserializer(String serializerIdKey) async {
    final identifier = await _storage.read(key: serializerIdKey);
    if (identifier == null) {
      return null;
    }
    return serializers.cast<PrivateWalletCredentialsSerializer?>().firstWhere(
          (element) => element?.identifier == identifier,
          orElse: () => null,
        );
  }

  PrivateWalletCredentialsSerializer? _findSerializer(PrivateWalletCredentials creds) =>
      serializers.cast<PrivateWalletCredentialsSerializer?>().firstWhere(
            (element) => element?.identifier == creds.serializerIdentifier,
            orElse: () => null,
          );
}
