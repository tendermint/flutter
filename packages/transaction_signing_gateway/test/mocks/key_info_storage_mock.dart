import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:transaction_signing_gateway/key_info_storage.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';

typedef KeyInfoRetriever = Future<Either<CredentialsStorageFailure, PrivateWalletCredentials>> Function(
    String, String, String);

class KeyInfoStorageMock extends Mock implements KeyInfoStorage {
  KeyInfoRetriever keyInfoRetriever;

  KeyInfoStorageMock({
    KeyInfoRetriever? retriever,
  }) : keyInfoRetriever = retriever ?? ((_, __, ___) async => left(const CredentialsStorageFailure("not implemented")));

  @override
  Future<Either<CredentialsStorageFailure, PrivateWalletCredentials>> getPrivateCredentials({
    required String? chainId,
    required String? walletId,
    required String? password,
  }) =>
      super.noSuchMethod(
        Invocation.method(#getPrivateCredentials, [], {
          #chainId: chainId,
          #walletId: walletId,
          #password: password,
        }),
        returnValue: Future<Either<CredentialsStorageFailure, PrivateWalletCredentials>>.value(
          left(const CredentialsStorageFailure("not mocked")),
        ),
      ) as Future<Either<CredentialsStorageFailure, PrivateWalletCredentials>>;
}
