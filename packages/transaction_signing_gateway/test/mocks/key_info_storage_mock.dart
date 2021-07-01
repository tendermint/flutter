import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/key_info_storage.dart';
import 'package:transaction_signing_gateway/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/transaction_signing_failure.dart';

typedef KeyInfoRetriever = Future<Either<TransactionSigningFailure, PrivateWalletCredentials>> Function();

class KeyInfoStorageMock implements KeyInfoStorage {
  KeyInfoRetriever keyInfoRetriever;

  KeyInfoStorageMock({
    KeyInfoRetriever? retriever,
  }) : keyInfoRetriever = retriever ?? (() async => left(const WalletCredentialsRetrievalFailure()));

  @override
  Future<Either<TransactionSigningFailure, PrivateWalletCredentials>> getPrivateCredentials() => keyInfoRetriever();
}
