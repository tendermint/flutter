import 'package:mobx/mobx.dart';
import 'package:starport_template/utils/base_env.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';
import 'package:alan/alan.dart' as alan;
import 'package:uuid/uuid.dart';

class WalletsStore {
  final TransactionSigningGateway _transactionSigningGateway;
  final BaseEnv baseEnv;

  WalletsStore(this._transactionSigningGateway, this.baseEnv);

  final Observable<bool> areWalletsLoading = Observable(false);

  final Observable<CredentialsStorageFailure?> loadWalletsFailure = Observable(null);

  Observable<List<WalletPublicInfo>> wallets = Observable([]);

  Future<void> loadWallets() async {
    areWalletsLoading.value = true;
    (await _transactionSigningGateway.getWalletsList()).fold(
      (fail) => loadWalletsFailure.value = fail,
      (newWallets) => wallets.value = newWallets,
    );
    areWalletsLoading.value = false;
  }

  Future<WalletPublicInfo> importAlanWallet(
    String mnemonic,
    String password,
  ) async {
    final wallet = alan.Wallet.derive(mnemonic.split(" "), baseEnv.networkInfo);
    final creds = AlanPrivateWalletCredentials(
      publicInfo: WalletPublicInfo(
        chainId: 'cosmos',
        walletId: const Uuid().v4(),
        name: 'First wallet',
        publicAddress: wallet.bech32Address,
      ),
      mnemonic: mnemonic,
      networkInfo: baseEnv.networkInfo,
    );
    await _transactionSigningGateway.storeWalletCredentials(
      credentials: creds,
      password: password,
    );
    wallets.value.add(creds.publicInfo);
    return creds.publicInfo;
  }
}
