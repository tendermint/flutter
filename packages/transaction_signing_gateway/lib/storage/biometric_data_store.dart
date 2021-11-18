import 'dart:convert';

import 'package:biometric_storage/biometric_storage.dart';
import 'package:cosmos_utils/future_either.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/storage/data_store.dart';

class BiometricDataStore implements SecureDataStore {
  BiometricStorageFile? _storageFile;
  final PromptInfo promptInfo;
  final String storageFileName;

  BiometricDataStore({
    this.promptInfo = PromptInfo.defaultValues,
    this.storageFileName = "cosmos_wallet_creds",
  });

  Future<BiometricStorageFile> _getStorageFile() async {
    _storageFile ??= await BiometricStorage().getStorage(
      storageFileName,
      promptInfo: promptInfo,
    );
    return _storageFile!;
  }

  @override
  Future<Either<CredentialsStorageFailure, String?>> readSecureText({
    required String key,
  }) async =>
      _readMap().flatMap(
        (keysMap) async => right(keysMap[key]),
      );

  @override
  Future<Either<CredentialsStorageFailure, Unit>> saveSecureText({
    required String key,
    required String? value,
  }) async =>
      _readMap().flatMap(
        (map) async => _writeMap({
          ...map,
          key: value,
        }),
      );

  Future<Either<CredentialsStorageFailure, Map<String, String?>>> _readMap() async {
    final storageRead = await (await _getStorageFile()).read() ?? "";
    final map = await compute(_decodeMap, storageRead);
    return right(map);
  }

  Future<Either<CredentialsStorageFailure, Unit>> _writeMap(
    Map<String, String?> map,
  ) async {
    try {
      final mapString = await compute(_encodeMap, map);
      (await _getStorageFile()).write(mapString);
      return right(unit);
    } catch (ex, stack) {
      return left(CredentialsStorageFailure("Could not write map to secure storage", cause: ex, stack: stack));
    }
  }
}

Map<String, String?> _decodeMap(String json) => jsonDecode(json) as Map<String, String?>? ?? {};

String _encodeMap(Map<String, String?> map) => jsonEncode(map);
