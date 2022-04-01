import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:starport_template/app_config.dart';
import 'package:starport_template/entities/account_additional_data.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/import_account_form_data.dart';
import 'package:starport_template/utils/cosmos_balances.dart';
import 'package:starport_template/utils/token_sender.dart';
import 'package:transaction_signing_gateway/alan/alan_account_derivation_info.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class AccountsStore {
  AccountsStore(
    this._transactionSigningGateway,
    this.appConfig,
  );

  static const chainId = 'my_starport_chain';
  final TransactionSigningGateway _transactionSigningGateway;

  final AppConfig appConfig;

  final Observable<bool> _areAccountsLoading = Observable(false);
  final Observable<bool> _isSendMoneyLoading = Observable(false);
  final Observable<bool> _isSendMoneyError = Observable(false);
  final Observable<bool> _isBalancesLoading = Observable(false);
  final Observable<bool> _isAccountImporting = Observable(false);
  final Observable<bool> _isAccountImportingError = Observable(false);
  final Observable<bool> _isMnemonicCreatingError = Observable(false);
  final Observable<bool> _isMnemonicCreating = Observable(false);
  final Observable<bool> _isBalancesLoadingError = Observable(false);
  final Observable<bool> _isRenamingAccount = Observable(false);
  final Observable<bool> _isSendingMoney = Observable(false);

  final ObservableList<Balance> balancesList = ObservableList();
  final Observable<CredentialsStorageFailure?> loadAccountsFailure = Observable(null);
  final Observable<CredentialsStorageFailure?> _renameAccountFailure = Observable(null);
  final ObservableList<AccountPublicInfo> accounts = ObservableList();

  int? get selectedAccountIndex => _selectetAccountIndex.value;

  double get defaultFee => 0.02;

  bool get areAccountsLoading => _areAccountsLoading.value;

  set areAccountsLoading(bool val) => Action(() => _areAccountsLoading.value = val)();

  bool get isSendingMoney => _isSendingMoney.value;

  set isSendingMoney(bool val) => Action(() => _isSendingMoney.value = val)();

  bool get isRenamingAccount => _isRenamingAccount.value;

  set isRenamingAccount(bool val) => Action(() => _isRenamingAccount.value = val)();

  bool get isSendMoneyError => _isSendMoneyError.value;

  set isSendMoneyError(bool val) => Action(() => _isSendMoneyError.value = val)();

  bool get isSendMoneyLoading => _isSendMoneyLoading.value;

  set isSendMoneyLoading(bool val) => Action(() => _isSendMoneyLoading.value = val)();

  bool get isBalancesLoadingError => _isBalancesLoadingError.value;

  set isBalancesLoadingError(bool val) => Action(() => _isBalancesLoadingError.value = val)();

  bool get isBalancesLoading => _isBalancesLoading.value;

  set isBalancesLoading(bool val) => Action(() => _isBalancesLoading.value = val)();

  bool get isAccountImportingError => _isAccountImportingError.value;

  set isAccountImportingError(bool val) => Action(() => _isAccountImportingError.value = val)();

  bool get isMnemonicCreatingError => _isMnemonicCreatingError.value;

  set isMnemonicCreatingError(bool val) => Action(() => _isMnemonicCreatingError.value = val)();

  bool get isMnemonicCreating => _isMnemonicCreating.value;

  set isMnemonicCreating(bool val) => Action(() => _isMnemonicCreating.value = val)();

  bool get isAccountImporting => _isAccountImporting.value;

  set isAccountImporting(bool val) => Action(() => _isAccountImporting.value = val)();

  CredentialsStorageFailure? get renameAccountFailure => _renameAccountFailure.value;

  set renameAccountFailure(CredentialsStorageFailure? val) => Action(() => _renameAccountFailure.value = val)();

  AccountPublicInfo get selectedAccount {
    final index = _selectetAccountIndex.value;
    if (index == null) {
      return const AccountPublicInfo(
        chainId: '',
        name: '',
        publicAddress: '',
        accountId: '',
      );
    }
    return accounts[index];
  }

  final Observable<int?> _selectetAccountIndex = Observable(null);

  set selectedAccountIndex(int? value) {
    if (_selectetAccountIndex.value != value) {
      Action(() => _selectetAccountIndex.value = value)();
      getBalances(selectedAccount.publicAddress);
      debugLog('account address: ${selectedAccount.publicAddress}');
    }
  }

  Future<void> loadAccounts() async {
    areAccountsLoading = true;
    (await _transactionSigningGateway.getAccountsList()).fold(
      (fail) => Action(() => loadAccountsFailure.value = fail)(),
      (newAccounts) {
        accounts
          ..clear()
          ..addAll(newAccounts);
        if (accounts.isNotEmpty) {
          selectedAccountIndex = 0;
        }
      },
    );
    areAccountsLoading = false;
  }

  Future<void> renameAccount(String name) async {
    isRenamingAccount = true;
    final newInfo = selectedAccount.copyWith(name: name);
    (await _transactionSigningGateway.updateAccountPublicInfo(
      info: newInfo,
    ))
        .fold(
      (fail) => Action(() => renameAccountFailure = fail)(),
      (success) {
        final index = accounts.indexWhere((it) => it.accountId == newInfo.accountId);
        accounts[index] = newInfo;
      },
    );
    isRenamingAccount = false;
  }

  Future<void> getBalances(String accountAddress) async {
    isBalancesLoadingError = false;
    isBalancesLoading = true;
    try {
      final newBalances = await CosmosBalances(appConfig).getBalances(accountAddress);
      balancesList
        ..clear()
        ..addAll(newBalances);
    } catch (error, stack) {
      logError(error, stack);
      isBalancesLoadingError = true;
    }
    isBalancesLoading = false;
  }

  Future<AccountPublicInfo?> importAlanAccount(
    ImportAccountFormData data, {
    VoidCallback? onAccountCreationStarted,
  }) async {
    isAccountImportingError = false;
    isAccountImporting = true;
    final result = await _transactionSigningGateway
        .deriveAccount(
      accountDerivationInfo: AlanAccountDerivationInfo(
        accountAlias: data.name,
        networkInfo: appConfig.networkInfo,
        mnemonic: data.mnemonic,
        chainId: chainId,
      ),
    )
        .mapError<dynamic>((fail) {
      return fail;
    }).flatMap(
      (credentials) {
        return _transactionSigningGateway
            .storeAccountCredentials(
          credentials: credentials,
          password: data.password,
        )
            .flatMap(
          (_) async {
            return _transactionSigningGateway.updateAccountPublicInfo(
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

    isAccountImporting = false;
    return result.fold(
      (fail) {
        logError(fail);
        isAccountImportingError = true;
        return null;
      },
      (credentials) {
        accounts.add(credentials.publicInfo);
        if (selectedAccount.publicAddress.isEmpty) {
          selectedAccountIndex = 0;
        }
        return credentials.publicInfo;
      },
    );
  }

  Future<void> sendTokens({
    required AccountPublicInfo info,
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

      await getBalances(selectedAccount.publicAddress);
    } catch (ex, stack) {
      logError(ex, stack);
      isSendMoneyError = true;
    }
    isSendMoneyLoading = false;
  }

  Future<AccountPublicInfo?> createNewAccount({
    required String password,
    required bool isBackedUp,
    VoidCallback? onMnemonicGenerationStarted,
    VoidCallback? onAccountCreationStarted,
  }) async {
    final mnemonic = await createMnemonic(onMnemonicGenerationStarted);
    if (mnemonic == null) {
      return null;
    }
    return importAlanAccount(
      ImportAccountFormData(
        mnemonic: mnemonic,
        name: 'Account ${accounts.length + 1}',
        additionalData: AccountAdditionalData(isBackedUp: isBackedUp),
        password: password,
      ),
      onAccountCreationStarted: onAccountCreationStarted,
    );
  }

  Future<String?> createMnemonic([
    VoidCallback? onMnemonicGenerationStarted,
  ]) async {
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

  void selectAccount(AccountPublicInfo account) {
    try {
      selectedAccountIndex = accounts.indexWhere((element) => element.accountId == account.accountId);
    } catch (ex, stack) {
      logError(ex, stack);
    }
  }
}
