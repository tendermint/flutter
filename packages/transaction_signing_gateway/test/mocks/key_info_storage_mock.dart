import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:transaction_signing_gateway/model/account_lookup_key.dart';
import 'package:transaction_signing_gateway/model/private_account_credentials.dart';
import 'package:transaction_signing_gateway/storage/key_info_storage.dart';

typedef KeyInfoRetriever = Future<Either<CredentialsStorageFailure, PrivateAccountCredentials>> Function(
  String,
  String,
  String,
);

class KeyInfoStorageMock extends Mock implements KeyInfoStorage {
  KeyInfoStorageMock({
    KeyInfoRetriever? retriever,
  }) : keyInfoRetriever = retriever ?? ((_, __, ___) async => left(const CredentialsStorageFailure('not implemented')));

  KeyInfoRetriever keyInfoRetriever;

  @override
  Future<Either<CredentialsStorageFailure, PrivateAccountCredentials>> getPrivateCredentials(
    AccountLookupKey? accountLookupKey,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #getPrivateCredentials,
          [
            accountLookupKey,
          ],
          {},
        ),
        returnValue: Future<Either<CredentialsStorageFailure, PrivateAccountCredentials>>.value(
          left(const CredentialsStorageFailure('not mocked')),
        ),
      ) as Future<Either<CredentialsStorageFailure, PrivateAccountCredentials>>;
}
