import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/import_wallet_form_data.dart';
import 'package:starport_template/utils/base_env.dart';
import 'package:starport_template/utils/cosmos_balances.dart';
import 'package:starport_template/utils/token_sender.dart';
import 'package:transaction_signing_gateway/alan/alan_wallet_derivation_info.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class WalletsStore {
  static const chainId = "my_starport_chain";
  final TransactionSigningGateway _transactionSigningGateway;
  final BaseEnv baseEnv;

  WalletsStore(this._transactionSigningGateway, this.baseEnv);

  final Observable<bool> _areWalletsLoading = Observable(false);

  final Observable<bool> _isSendMoneyLoading = Observable(false);
  final Observable<bool> _isSendMoneyError = Observable(false);
  final Observable<bool> _isBalancesLoading = Observable(false);
  final Observable<bool> _isWalletImporting = Observable(false);
  final Observable<bool> _isWalletImportingError = Observable(false);
  final Observable<bool> _isBalancesLoadingError = Observable(false);
  final ObservableList<Balance> balancesList = ObservableList();
  final Observable<CredentialsStorageFailure?> loadWalletsFailure = Observable(null);
  final ObservableList<WalletPublicInfo> wallets = ObservableList();

  bool get areWalletsLoading => _areWalletsLoading.value;

  set areWalletsLoading(bool val) => Action(() => _areWalletsLoading.value = val)();

  bool get isSendMoneyError => _isSendMoneyError.value;

  set isSendMoneyError(bool val) => Action(() => _isSendMoneyError.value = val)();

  bool get isSendMoneyLoading => _isSendMoneyLoading.value;

  set isSendMoneyLoading(bool val) => Action(() => _isSendMoneyLoading.value = val)();

  bool get isBalancesLoadingError => _isBalancesLoadingError.value;

  set isBalancesLoadingError(bool val) => Action(() => _isBalancesLoadingError.value = val)();

  bool get isBalancesLoading => _isBalancesLoading.value;

  set isBalancesLoading(bool val) => Action(() => _isBalancesLoading.value = val)();

  bool get isWalletImportingError => _isWalletImportingError.value;

  set isWalletImportingError(bool val) => Action(() => _isWalletImportingError.value = val)();

  bool get isWalletImporting => _isWalletImporting.value;

  set isWalletImporting(bool val) => Action(() => _isWalletImporting.value = val)();

  Future<void> loadWallets() async {
    areWalletsLoading = true;
    (await _transactionSigningGateway.getWalletsList()).fold(
      (fail) => loadWalletsFailure.value = fail,
      (newWallets) {
        wallets.clear();
        wallets.addAll(newWallets);
      },
    );
    areWalletsLoading = false;
  }

  Future<void> getBalances(String walletAddress) async {
    isBalancesLoadingError = false;
    isBalancesLoading = true;
    try {
      balancesList.clear();
      balancesList.addAll(await CosmosBalances(baseEnv).getBalances(walletAddress));
    } catch (error, stack) {
      logError(error, stack);
      isBalancesLoadingError = true;
    }
    isBalancesLoading = false;
  }

  Future<void> importAlanWallet(
    ImportWalletFormData data,
  ) async {
    isWalletImportingError = false;
    isWalletImporting = true;
    final result = await _transactionSigningGateway
        .deriveWallet(
            walletDerivationInfo: AlanWalletDerivationInfo(
          walletAlias: data.name,
          networkInfo: baseEnv.networkInfo,
          mnemonic: data.mnemonic,
          chainId: chainId,
        ))
        .mapError<dynamic>((fail) => fail)
        .flatMap(
          (credentials) => _transactionSigningGateway
              .storeWalletCredentials(
                credentials: credentials,
                password: data.password,
              )
              .mapSuccess((_) => credentials),
        );

    result.fold(
      (fail) {
        logError(fail);
        isWalletImportingError = true;
      },
      (credentials) => wallets.add(credentials.publicInfo),
    );

    isWalletImporting = false;
  }

  Future<void> sendTokens({
    required WalletPublicInfo info,
    required Balance balance,
    required String toAddress,
    required String password,
  }) async {
    isSendMoneyLoading = true;
    isSendMoneyError = false;
    try {
      await TokenSender(_transactionSigningGateway).sendCosmosMoney(
        info,
        balance,
        toAddress,
        password,
      );
    } catch (ex, stack) {
      logError(ex, stack);
      isBalancesLoadingError = true;
    }
    isSendMoneyLoading = false;
  }
}
