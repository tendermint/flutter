import 'dart:convert';

import 'package:biometric_storage/biometric_storage.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:cosmos_utils/extensions.dart';
import 'package:cosmos_utils/future_either.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/storage/data_store.dart';

class BiometricDataStore implements SecureDataStore {
  final PromptInfo promptInfo;
  final String storageFileName;
  final StorageFileInitOptions _storageFileInitOptions;

  BiometricDataStore({
    this.promptInfo = PromptInfo.defaultValues,
    this.storageFileName = "cosmos_wallet_creds",
    StorageFileInitOptions? storageFileInitOptions,
  }) : _storageFileInitOptions = storageFileInitOptions ?? StorageFileInitOptions(
    authenticationValidityDurationSeconds: 1,// so that consecutive writes after reads won't ask for auth twice.
  );

  /// Convenience helper method to check whether biometric authentication is available on the device
  Future<Either<BiometricCredentialsStorageFailure, Unit>> authenticateUser() async {
    return _readMap() //
        .mapError<BiometricCredentialsStorageFailure>((err) {
      if (err is BiometricCredentialsStorageFailure) {
        return err;
      } else {
        return BiometricCredentialsStorageFailure.unknown("$err");
      }
    }).flatMap((a) async {
      return right(unit);
    });
  }

  @override
  Future<Either<CredentialsStorageFailure, String?>> readSecureText({
    required String key,
  }) async =>
      _readMap().flatMap(
        (keysMap) async {
          return right(keysMap[key]);
        },
      );

  @override
  Future<Either<CredentialsStorageFailure, Unit>> saveSecureText({
    required String key,
    required String? value,
  }) async =>
      _readMap().flatMap(
        (map) async {
          return _writeMap({
          ...map,
          key: value,
        });
        },
      );

  Future<Either<CredentialsStorageFailure, Map<String, String?>>> _readMap() async {
    try {
      return _getStorageFile() //
          .flatMap((storageFile) async {
            final fileRead = await storageFile.read();
            return right(fileRead ?? "");
          })
          .flatMap((storageRead) async {
            return right(await compute(_decodeMap, storageRead));
          });
    } catch (ex, stack) {
      logError(ex, stack);
      return left(CredentialsStorageFailure("$ex"));
    }
  }

  Future<Either<CredentialsStorageFailure, Unit>> _writeMap(
    Map<String, String?> map,
  ) async {
    try {
      final mapString = await compute(_encodeMap, map);
      final result = await _getStorageFile() //
          .flatMap((file) async {
            return right(await file.write(mapString));
          })
          .flatMap((_) async {
            return right(unit);
          });
      return result;
    } catch (ex, stack) {
      return left(
        CredentialsStorageFailure(
          "Could not write map to secure storage",
          cause: ex,
          stack: stack,
        ),
      );
    }
  }

  Future<Either<CredentialsStorageFailure, BiometricStorageFile>> _getStorageFile() async {
    final biometricStorage = BiometricStorage();
    final canAuthenticate = await biometricStorage.canAuthenticate();
    switch (canAuthenticate) {
      case CanAuthenticateResponse.success:
        final storageFile = await biometricStorage.getStorage(
          storageFileName,
          options: _storageFileInitOptions,
          promptInfo: promptInfo,
        );
        return right(storageFile);
      case CanAuthenticateResponse.errorHwUnavailable:
        return left(BiometricCredentialsStorageFailure.unavailable());
      case CanAuthenticateResponse.errorNoBiometricEnrolled:
        return left(BiometricCredentialsStorageFailure.noBiometricEnrolled());
      case CanAuthenticateResponse.errorNoHardware:
        return left(BiometricCredentialsStorageFailure.noHardware());
      case CanAuthenticateResponse.statusUnknown:
        return left(BiometricCredentialsStorageFailure.unknown());
      case CanAuthenticateResponse.unsupported:
        return left(BiometricCredentialsStorageFailure.unsupported());
    }
  }
}

Map<String, String?> _decodeMap(String json) => (json.trim().isEmpty
        ? //
        <String, dynamic>{}
        : jsonDecode(json) as Map<String, dynamic>? ?? <String, dynamic>{})
    .cast();

String _encodeMap(Map<String, String?> map) => jsonEncode(map);

enum BiometricCredentialsFailureReason {
  unsupported,
  unavailable,
  noBiometricEnrolled,
  noHardware,
  unknown,
}

class BiometricCredentialsStorageFailure extends CredentialsStorageFailure {
  final BiometricCredentialsFailureReason reason;

  BiometricCredentialsStorageFailure.unsupported()
      : reason = BiometricCredentialsFailureReason.unsupported,
        super("Biometric authentication is unsupported");

  BiometricCredentialsStorageFailure.unavailable()
      : reason = BiometricCredentialsFailureReason.unavailable,
        super("Biometric authentication is not available");

  BiometricCredentialsStorageFailure.noBiometricEnrolled()
      : reason = BiometricCredentialsFailureReason.noBiometricEnrolled,
        super("Biometric authentication is not enrolled");

  BiometricCredentialsStorageFailure.noHardware()
      : reason = BiometricCredentialsFailureReason.noHardware,
        super("Device has no hardware for biometric authentication");

  BiometricCredentialsStorageFailure.unknown([String? message])
      : reason = BiometricCredentialsFailureReason.unknown,
        super(message ?? "Biometric authentication is unsupported");

  @override
  String toString() {
    return 'BiometricCredentialsStorageFailure{reason: $reason, message: $message}';
  }
}
