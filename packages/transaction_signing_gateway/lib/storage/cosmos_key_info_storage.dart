import 'dart:convert';

import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:transaction_signing_gateway/encrypt/aes_cipher.dart';
import 'package:transaction_signing_gateway/encrypt/cipher.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials_serializer.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_lookup_key.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info_serializer.dart';
import 'package:transaction_signing_gateway/storage/data_store.dart';
import 'package:transaction_signing_gateway/storage/key_info_storage.dart';

class CosmosKeyInfoStorage implements KeyInfoStorage {
  static const _publicKeySuffix = ":public";
  final List<PrivateWalletCredentialsSerializer> serializers;
  final SecureDataStore _secureDataStore;
  final PlainDataStore _plainDataStore;
  final Cipher _cipher;

  CosmosKeyInfoStorage({
    required this.serializers,
    required SecureDataStore secureDataStore,
    required PlainDataStore plainDataStore,
    Cipher? cipher,
  })  : _secureDataStore = secureDataStore,
        _plainDataStore = plainDataStore,
        _cipher = cipher ?? AESCipher();

  @override
  Future<Either<CredentialsStorageFailure, PrivateWalletCredentials>> getPrivateCredentials(
    WalletLookupKey walletLookupKey,
  ) =>
      _secureDataStore
          .readSecureText(
            key: _credentialsKey(
              chainId: walletLookupKey.chainId,
              walletId: walletLookupKey.walletId,
            ),
          )
          .zipWith(
            _findDeserializer(
              _serializerIdKey(
                chainId: walletLookupKey.chainId,
                walletId: walletLookupKey.walletId,
              ),
            ),
          )
          .flatMap<PrivateWalletCredentials>(
        (tuple) async {
          final data = tuple.value1;
          final serializer = tuple.value2;
          if (data == null) {
            return left(CredentialsStorageFailure("Could not find credentials for $walletLookupKey"));
          }
          if (serializer == null) {
            return left(CredentialsStorageFailure("Could not find proper deserializer for $walletLookupKey"));
          }

          try {
            final decrypted = _cipher.decrypt(password: walletLookupKey.password, encryptedData: data);
            final json = await compute(jsonDecode, decrypted) as Map<String, dynamic>;
            return serializer.fromJson(json);
          } catch (error) {
            return left(const CredentialsStorageFailure("invalid password"));
          }
        },
      ).doOn(
        fail: (fail) => logError(fail),
      );

  String _credentialsKey({required String chainId, required String walletId}) => "$chainId:$walletId";

  String _publicInfoKey({required String chainId, required String walletId}) => "$chainId:$walletId$_publicKeySuffix";

  bool _isPublicInfoKey(String key) => key.endsWith(_publicKeySuffix);

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
      chainId: walletCredentials.publicInfo.chainId,
      walletId: walletCredentials.publicInfo.walletId,
    );
    final serializerKey = _serializerIdKey(
      chainId: walletCredentials.publicInfo.chainId,
      walletId: walletCredentials.publicInfo.walletId,
    );
    final publicInfoKey = _publicInfoKey(
      chainId: walletCredentials.publicInfo.chainId,
      walletId: walletCredentials.publicInfo.walletId,
    );
    final publicInfoJson = await compute(jsonEncode, WalletPublicInfoSerializer.toMap(walletCredentials.publicInfo));
    return Future.value(serializer.toJson(walletCredentials))
        .flatMap((jsonMap) async => right(await compute(jsonEncode, jsonMap)))
        .flatMap(
      (jsonString) async {
        try {
          final encrypted = _cipher.encrypt(password: password, data: jsonString);
          await _secureDataStore.saveSecureText(key: credsKey, value: encrypted);
          await _plainDataStore.savePlainText(key: serializerKey, value: walletCredentials.serializerIdentifier);
          await _plainDataStore.savePlainText(key: publicInfoKey, value: publicInfoJson);
          return right(unit);
        } catch (e) {
          return left(CredentialsStorageFailure("$e"));
        }
      },
    );
  }

  @override
  Future<Either<CredentialsStorageFailure, List<WalletPublicInfo>>> getWalletsList() async =>
      _plainDataStore.readAllPlainText().flatMap(
        (storageMap) async {
          try {
            final infos = storageMap.keys //
                .where((element) => _isPublicInfoKey(element))
                .map((key) => jsonDecode(storageMap[key] ?? "") as Map<String, dynamic>)
                .map((json) => WalletPublicInfoSerializer.fromMap(json))
                .toList();
            return right(infos);
          } catch (e) {
            return left(CredentialsStorageFailure("$e"));
          }
        },
      );

  Future<Either<CredentialsStorageFailure, PrivateWalletCredentialsSerializer?>> _findDeserializer(
    String serializerIdKey,
  ) =>
      _plainDataStore.readPlainText(key: serializerIdKey).flatMap(
        (identifier) async {
          if (identifier == null) {
            return right(null);
          }
          return right(
            serializers.cast<PrivateWalletCredentialsSerializer?>().firstWhere(
                  (element) => element?.identifier == identifier,
                  orElse: () => null,
                ),
          );
        },
      );

  PrivateWalletCredentialsSerializer? _findSerializer(PrivateWalletCredentials creds) =>
      serializers.cast<PrivateWalletCredentialsSerializer?>().firstWhere(
            (element) => element?.identifier == creds.serializerIdentifier,
            orElse: () => null,
          );

  @override
  Future<Either<TransactionSigningFailure, bool>> verifyLookupKey(WalletLookupKey walletLookupKey) async {
    final privateCreds = await getPrivateCredentials(walletLookupKey);
    return right(privateCreds.isRight());
  }

  @override
  Future<Either<CredentialsStorageFailure, Unit>> updatePublicWalletInfo({required WalletPublicInfo info}) async {
    try {
      final publicInfoKey = _publicInfoKey(
        chainId: info.chainId,
        walletId: info.walletId,
      );

      return _plainDataStore.readPlainText(key: publicInfoKey).flatMap((walletInfo) async {
        if (walletInfo == null) {
          return left(const CredentialsStorageFailure("Wallet not found"));
        }

        final publicInfoJson = await compute(jsonEncode, WalletPublicInfoSerializer.toMap(info));
        await _plainDataStore.savePlainText(key: publicInfoKey, value: publicInfoJson);

        return right(unit);
      });
    } catch (e, stack) {
      logError(e, stack);
      return left(CredentialsStorageFailure("$e"));
    }
  }
}
