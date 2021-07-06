import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:transaction_signing_gateway/key_info_storage.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';

typedef KeyInfoRetriever = Future<Either<TransactionSigningFailure, PrivateWalletCredentials>> Function(
    String, String, String);

class KeyInfoStorageMock extends Mock implements KeyInfoStorage {
  KeyInfoRetriever keyInfoRetriever;

  KeyInfoStorageMock({
    KeyInfoRetriever? retriever,
  }) : keyInfoRetriever =
            retriever ?? ((_, __, ___) async => left(const WalletCredentialsRetrievalFailure("not implemented")));

  @override
  Future<Either<TransactionSigningFailure, PrivateWalletCredentials>> getPrivateCredentials({
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
        returnValue: Future<Either<TransactionSigningFailure, PrivateWalletCredentials>>.value(
          left(const TransactionSignerNotFoundFailure()),
        ),
      ) as Future<Either<TransactionSigningFailure, PrivateWalletCredentials>>;
}
