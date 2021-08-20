import 'package:mobx/mobx.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/utils/base_env.dart';
import 'package:starport_template/utils/cosmos_balances.dart';
import 'package:starport_template/utils/token_sender.dart';
import 'package:transaction_signing_gateway/alan/alan_wallet_derivation_info.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class WalletsStore {
  final TransactionSigningGateway _transactionSigningGateway;
  final BaseEnv baseEnv;

  WalletsStore(this._transactionSigningGateway, this.baseEnv);

  final Observable<bool> _areWalletsLoading = Observable(false);

  final Observable<bool> _isSendMoneyLoading = Observable(false);
  final Observable<bool> _isSendMoneyError = Observable(false);
  final Observable<bool> _isBalancesLoading = Observable(false);
  final Observable<bool> _isError = Observable(false);

  bool get areWalletsLoading => _areWalletsLoading.value;

  set areWalletsLoading(bool val) => Action(() => _areWalletsLoading.value = val)();

  bool get isSendMoneyError => _isSendMoneyError.value;

  set isSendMoneyError(bool val) => Action(() => _isSendMoneyError.value = val)();

  bool get isSendMoneyLoading => _isSendMoneyLoading.value;

  set isSendMoneyLoading(bool val) => Action(() => _isSendMoneyLoading.value = val)();

  bool get isError => _isError.value;

  set isError(bool val) => Action(() => _isError.value = val)();

  bool get isBalancesLoading => _isBalancesLoading.value;

  set isBalancesLoading(bool val) => Action(() => _isBalancesLoading.value = val)();

  final Observable<List<Balance>> balancesList = Observable([]);

  final Observable<CredentialsStorageFailure?> loadWalletsFailure = Observable(null);

  Observable<List<WalletPublicInfo>> wallets = Observable([]);

  Future<void> loadWallets() async {
    areWalletsLoading = true;
    (await _transactionSigningGateway.getWalletsList()).fold(
      (fail) => loadWalletsFailure.value = fail,
      (newWallets) => wallets.value = newWallets,
    );
    areWalletsLoading = false;
  }

  Future<void> getBalances(String walletAddress) async {
    isError = false;
    isBalancesLoading = true;
    try {
      balancesList.value = await CosmosBalances(baseEnv).getBalances(walletAddress);
    } catch (error) {
      isError = false;
    }
    isBalancesLoading = false;
  }

  Future<void> importAlanWallet(
    String mnemonic,
    String password,
  ) async {
    final info = AlanWalletDerivationInfo(
      walletAlias: 'First wallet',
      networkInfo: baseEnv.networkInfo,
      mnemonic: mnemonic,
    );

    final privateCreds = await _transactionSigningGateway.deriveWallet(walletDerivationInfo: info);

    await privateCreds.fold<Future?>((fail) => null, (privateCreds) async {
      await _transactionSigningGateway.storeWalletCredentials(
        credentials: privateCreds,
        password: password,
      );
      wallets.value.add(privateCreds.publicInfo);
    });
  }

  Future<void> sendCosmosMoney(
    WalletPublicInfo info,
    Balance balance,
    String toAddress,
  ) async {
    isSendMoneyLoading = true;
    isSendMoneyError = false;
    try {
      await TokenSender(_transactionSigningGateway).sendCosmosMoney(
        info,
        balance,
        toAddress,
      );
    } catch (ex) {
      isError = true;
    }
    isSendMoneyLoading = false;
  }
}
