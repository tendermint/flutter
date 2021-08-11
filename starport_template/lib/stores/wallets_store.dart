import 'package:mobx/mobx.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/utils/base_env.dart';
import 'package:starport_template/utils/cosmos_balances.dart';
import 'package:starport_template/utils/token_sender.dart';
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

  final Observable<bool> isSendMoneyLoading = Observable(false);
  final Observable<bool> isSendMoneyError = Observable(false);
  final Observable<bool> isBalancesLoading = Observable(false);
  final Observable<bool> isError = Observable(false);

  final Observable<List<Balance>> balancesList = Observable([]);

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

  Future<void> getBalances(String walletAddress) async {
    isError.value = false;
    isBalancesLoading.value = true;
    try {
      balancesList.value = await CosmosBalances(baseEnv).getBalances(walletAddress);
    } catch (error) {
      isError.value = false;
    }
    isBalancesLoading.value = false;
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

  Future<void> sendCosmosMoney(
    WalletPublicInfo info,
    Balance balance,
    String toAddress,
  ) async {
    isSendMoneyLoading.value = true;
    isSendMoneyError.value = false;
    try {
      await TokenSender(_transactionSigningGateway).sendCosmosMoney(
        info,
        balance,
        toAddress,
      );
    } catch (ex) {
      isError.value = true;
    }
    isSendMoneyLoading.value = false;
  }
}
