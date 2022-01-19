import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/import_wallet_form_data.dart';
import 'package:starport_template/entities/wallet_additional_data.dart';
import 'package:starport_template/utils/base_env.dart';
import 'package:starport_template/utils/cosmos_balances.dart';
import 'package:starport_template/utils/token_sender.dart';
import 'package:transaction_signing_gateway/alan/alan_wallet_derivation_info.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class WalletsStore {
  WalletsStore(
    this._transactionSigningGateway,
    this.baseEnv,
  );

  static const chainId = 'my_starport_chain';
  final TransactionSigningGateway _transactionSigningGateway;

  final BaseEnv baseEnv;

  final Observable<bool> _areWalletsLoading = Observable(false);
  final Observable<bool> _isSendMoneyLoading = Observable(false);
  final Observable<bool> _isSendMoneyError = Observable(false);
  final Observable<bool> _isBalancesLoading = Observable(false);
  final Observable<bool> _isWalletImporting = Observable(false);
  final Observable<bool> _isWalletImportingError = Observable(false);
  final Observable<bool> _isMnemonicCreatingError = Observable(false);
  final Observable<bool> _isMnemonicCreating = Observable(false);
  final Observable<bool> _isBalancesLoadingError = Observable(false);
  final Observable<bool> _isRenamingWallet = Observable(false);
  final Observable<bool> _isSendingMoney = Observable(false);

  final ObservableList<Balance> balancesList = ObservableList();
  final Observable<CredentialsStorageFailure?> loadWalletsFailure = Observable(null);
  final Observable<CredentialsStorageFailure?> _renameWalletFailure = Observable(null);
  final ObservableList<WalletPublicInfo> wallets = ObservableList();

  int? get selectedWalletIndex => _selectedWalletIndex.value;

  double get defaultFee => 0.02;

  bool get areWalletsLoading => _areWalletsLoading.value;

  set areWalletsLoading(bool val) => Action(() => _areWalletsLoading.value = val)();

  bool get isSendingMoney => _isSendingMoney.value;

  set isSendingMoney(bool val) => Action(() => _isSendingMoney.value = val)();

  bool get isRenamingWallet => _isRenamingWallet.value;

  set isRenamingWallet(bool val) => Action(() => _isRenamingWallet.value = val)();

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

  bool get isMnemonicCreatingError => _isMnemonicCreatingError.value;

  set isMnemonicCreatingError(bool val) => Action(() => _isMnemonicCreatingError.value = val)();

  bool get isMnemonicCreating => _isMnemonicCreating.value;

  set isMnemonicCreating(bool val) => Action(() => _isMnemonicCreating.value = val)();

  bool get isWalletImporting => _isWalletImporting.value;

  set isWalletImporting(bool val) => Action(() => _isWalletImporting.value = val)();

  CredentialsStorageFailure? get renameWalletFailure => _renameWalletFailure.value;

  set renameWalletFailure(CredentialsStorageFailure? val) => Action(() => _renameWalletFailure.value = val)();

  WalletPublicInfo get selectedWallet {
    final index = _selectedWalletIndex.value;
    if (index == null) {
      return const WalletPublicInfo(chainId: '', name: '', publicAddress: '', walletId: '');
    }
    return wallets[index];
  }

  final Observable<int?> _selectedWalletIndex = Observable(null);

  set selectedWalletIndex(int? value) {
    if (selectedWalletIndex != value) {
      Action(() => _selectedWalletIndex.value = value)();
      getBalances(selectedWallet.publicAddress);
    }
  }

  Future<void> loadWallets() async {
    areWalletsLoading = true;
    (await _transactionSigningGateway.getWalletsList()).fold(
      (fail) => Action(() => loadWalletsFailure.value = fail)(),
      (newWallets) {
        wallets
          ..clear()
          ..addAll(newWallets);
        if (wallets.isNotEmpty) {
          selectedWalletIndex = 0;
        }
      },
    );
    areWalletsLoading = false;
  }

  Future<void> renameWallet(String name) async {
    isRenamingWallet = true;
    final newInfo = selectedWallet.copyWith(name: name);
    (await _transactionSigningGateway.updateWalletPublicInfo(
      info: newInfo,
    ))
        .fold(
      (fail) => Action(() => renameWalletFailure = fail)(),
      (success) {
        final index = wallets.indexWhere((it) => it.walletId == newInfo.walletId);
        wallets[index] = newInfo;
      },
    );
    isRenamingWallet = false;
  }

  Future<void> getBalances(String walletAddress) async {
    isBalancesLoadingError = false;
    isBalancesLoading = true;
    try {
      balancesList
        ..clear()
        ..addAll(await CosmosBalances(baseEnv).getBalances(walletAddress));
    } catch (error, stack) {
      logError(error, stack);
      isBalancesLoadingError = true;
    }
    isBalancesLoading = false;
  }

  Future<WalletPublicInfo?> importAlanWallet(
    ImportWalletFormData data, {
    VoidCallback? onWalletCreationStarted,
  }) async {
    isWalletImportingError = false;
    isWalletImporting = true;
    final result = await _transactionSigningGateway
        .deriveWallet(
      walletDerivationInfo: AlanWalletDerivationInfo(
        walletAlias: data.name,
        networkInfo: baseEnv.networkInfo,
        mnemonic: data.mnemonic,
        chainId: chainId,
      ),
    )
        .mapError<dynamic>((fail) {
      return fail;
    }).flatMap(
      (credentials) {
        return _transactionSigningGateway
            .storeWalletCredentials(
          credentials: credentials,
          password: data.password,
        )
            .flatMap(
          (_) async {
            return _transactionSigningGateway.updateWalletPublicInfo(
              info: credentials.publicInfo.copyWith(
                additionalData: data.additionalData.toJsonString(),
              ),
            );
          },
        ).mapSuccess((_) {
          return credentials;
        });
      },
    );

    isWalletImporting = false;
    return result.fold(
      (fail) {
        logError(fail);
        isWalletImportingError = true;
        return null;
      },
      (credentials) {
        wallets.add(credentials.publicInfo);
        if (selectedWallet.publicAddress.isEmpty) {
          selectedWalletIndex = 0;
        }
        return credentials.publicInfo;
      },
    );
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
      isSendMoneyError = true;
    }
    isSendMoneyLoading = false;
  }

  Future<WalletPublicInfo?> createNewWallet({
    required String password,
    required bool isBackedUp,
    VoidCallback? onMnemonicGenerationStarted,
    VoidCallback? onWalletCreationStarted,
  }) async {
    final mnemonic = await createMnemonic(onMnemonicGenerationStarted);
    if (mnemonic == null) {
      return null;
    }
    return importAlanWallet(
      ImportWalletFormData(
        mnemonic: mnemonic,
        name: 'Wallet ${wallets.length + 1}',
        additionalData: WalletAdditionalData(isBackedUp: isBackedUp),
        password: password,
      ),
      onWalletCreationStarted: onWalletCreationStarted,
    );
  }

  Future<String?> createMnemonic([VoidCallback? onMnemonicGenerationStarted]) async {
    isMnemonicCreatingError = false;
    isMnemonicCreating = true;
    String? mnemonic;
    onMnemonicGenerationStarted?.call();
    try {
      mnemonic = await generateMnemonic();
    } catch (ex, stack) {
      logError(ex, stack);
      isMnemonicCreatingError = true;
    }
    isMnemonicCreating = false;
    return mnemonic;
  }

  void selectWallet(WalletPublicInfo wallet) {
    try {
      selectedWalletIndex = wallets.indexWhere((element) => element.walletId == wallet.walletId);
    } catch (ex, stack) {
      logError(ex, stack);
    }
  }
}
