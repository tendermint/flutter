import 'package:cosmos_auth/cosmos_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mocks.dart';

void main() {
  //
  late StubSecureDataStore dataStore;
  late MockBiometrics biometrics;

  test('saving password', () async {
    await CosmosAuth(
      biometrics: biometrics,
    ).savePassword(
      secureDataStore: dataStore,
      id: 'main',
      password: 'password',
    );

    expect(dataStore.map.keys.first, 'cosmos_pw_main');
    expect(dataStore.map['cosmos_pw_main'], 'password');
  });
  //
  test('reading password on successful biometrics', () async {
    biometrics.mockAuthenticate(result: right(true));
    final cosmosAuth = CosmosAuth(
      biometrics: biometrics,
    );
    await cosmosAuth.savePassword(
      secureDataStore: dataStore,
      id: 'main',
      password: 'password',
    );
    final result = await cosmosAuth.readPassword(secureDataStore: dataStore, id: 'main');
    expect(result.isRight(), true);
    expect(result.getOrElse(() => ''), 'password');
  });
  //
  test('reading password on failed biometrics', () async {
    biometrics.mockAuthenticate(result: left(const LocalAuthFailure.noBiometricsAvailable()));
    final cosmosAuth = CosmosAuth(
      biometrics: biometrics,
    );
    await cosmosAuth.savePassword(
      secureDataStore: dataStore,
      id: 'main',
      password: 'password',
    );
    final result = await cosmosAuth.readPassword(
      secureDataStore: dataStore,
      id: 'main',
    );
    expect(result.isLeft(), true);
    expect(
      result.swap().getOrElse(() => throw Error()).type,
      ReadPasswordFailureType.AuthenticationFailed,
    );
  });
  //
  test('hasPassword - not existing', () async {
    final cosmosAuth = CosmosAuth(
      biometrics: biometrics,
    );
    final result = await cosmosAuth.hasPassword(
      secureDataStore: dataStore,
      id: 'main',
    );
    expect(result.isRight(), true);
    expect(
      result.getOrElse(() => throw Error()),
      false,
    );
  });
  //
  test('hasPassword - existing', () async {
    final cosmosAuth = CosmosAuth(
      biometrics: biometrics,
    );
    await cosmosAuth.savePassword(
      secureDataStore: dataStore,
      id: 'main',
      password: 'password',
    );

    final result = await cosmosAuth.hasPassword(
      secureDataStore: dataStore,
      id: 'main',
    );
    expect(result.isRight(), true);
    expect(
      result.getOrElse(() => throw Error()),
      true,
    );
  });

  setUp(() {
    dataStore = StubSecureDataStore();
    biometrics = MockBiometrics();
  });
}
