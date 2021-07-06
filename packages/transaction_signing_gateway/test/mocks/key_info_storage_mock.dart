import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:transaction_signing_gateway/key_info_storage.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';

typedef KeyInfoRetriever = Future<Either<TransactionSigningFailure, PrivateWalletCredentials>> Function();

class KeyInfoStorageMock extends Mock implements KeyInfoStorage {
  KeyInfoRetriever keyInfoRetriever;

  KeyInfoStorageMock({
    KeyInfoRetriever? retriever,
  }) : keyInfoRetriever = retriever ?? (() async => left(const WalletCredentialsRetrievalFailure()));

  @override
  Future<Either<TransactionSigningFailure, PrivateWalletCredentials>> getPrivateCredentials() => super.noSuchMethod(
        Invocation.method(
          #getPrivateCredentials,
          [],
        ),
        returnValue: Future<Either<TransactionSigningFailure, PrivateWalletCredentials>>.value(
          left(const TransactionSignerNotFoundFailure()),
        ),
      ) as Future<Either<TransactionSigningFailure, PrivateWalletCredentials>>;
}
