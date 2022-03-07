import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_ui_components/models/account_info.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/pages/account_name_page.dart';
import 'package:starport_template/pages/create_account_page.dart';
import 'package:starport_template/pages/import_account_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class AccountsListSheet extends StatefulWidget {
  const AccountsListSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountsListSheet> createState() => _AccountsListSheetState();
}

class _AccountsListSheetState extends State<AccountsListSheet> {
  List<AccountPublicInfo> get publicInfos => StarportApp.accountsStore.accounts;

  AccountPublicInfo get selectedAccount => StarportApp.accountsStore.selectedAccount;

  List<AccountInfo> get accountInfos => publicInfos
      .map(
        (publicInfo) => AccountInfo(
          name: publicInfo.name,
          address: publicInfo.publicAddress,
          accountId: publicInfo.accountId,
        ),
      )
      .toList();

  bool isEditingAccountList = false;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    //ignore: deprecated_member_use_from_same_package
    return CosmosBottomSheetContainer(
      child: SafeArea(
        top: false,
        child: Observer(
          builder: (context) => ContentStateSwitcher(
            emptyChild: const EmptyListMessage(
              message: 'No accounts found. Add one.',
            ),
            isLoading: StarportApp.accountsStore.isRenamingAccount,
            isEmpty: accountInfos.isEmpty,
            contentChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CosmosBottomSheetHeader(
                  title: 'Accounts',
                  titleTextStyle: CosmosTextTheme.title2Bold,
                  leading: CosmosTextButton(
                    text: isEditingAccountList ? 'Done' : 'Edit',
                    onTap: () => setState(() {
                      isEditingAccountList = !isEditingAccountList;
                    }),
                  ),
                  actions: [CosmosTextButton(text: 'Close', onTap: () => Navigator.of(context).pop())],
                ),
                SizedBox(height: theme.spacingXL),
                _buildMainList(),
                const CosmosDivider(),
                SizedBox(height: theme.spacingL),
                CosmosCircleTextButton(
                  onTap: isEditingAccountList ? null : _onTapCreateAccount,
                  text: 'Create account',
                  asset: 'assets/images/plus_circle.png',
                ),
                CosmosCircleTextButton(
                  onTap: isEditingAccountList ? null : _onTapImportAccount,
                  text: 'Import account',
                  asset: 'assets/images/arrow_down_circle.png',
                ),
                SizedBox(height: theme.spacingL),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapCreateAccount() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateAccountPage()));
  }

  void _onTapImportAccount() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ImportAccountPage()));
  }

  Expanded _buildMainList() {
    return Expanded(
      child: Observer(
        builder: (context) => CosmosAccountsListView(
          list: accountInfos,
          selectedAccount: accountInfos.firstWhere((element) => element.address == selectedAccount.publicAddress),
          onClicked: _accountClicked,
          isEditing: isEditingAccountList,
          onEditIconPressed: _onEditIconPressed,
        ),
      ),
    );
  }

  Future<void> _onTapRenameAccount(AccountInfo accountInfo) async {
    final newName = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (context) => AccountNamePage(name: accountInfo.name),
      ),
    );
    if (!mounted) {
      return;
    }
    if (newName != null) {
      Navigator.of(context).pop();
      await _renameAccount(newName);
    }
  }

  Future<void> _renameAccount(String newName) async {
    await StarportApp.accountsStore.renameAccount(newName);
    if (StarportApp.accountsStore.renameAccountFailure != null) {
      await showCosmosAlertDialog(
        context: context,
        dialogBuilder: (context) => CosmosAlertDialog(
          title: 'Something went wrong',
          message: 'We had problems renaming your account.',
          actions: [
            CosmosModalAction(
              text: 'Ok',
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
    }
  }

  void _accountClicked(int index) => Navigator.of(context).pop(publicInfos[index]);

  void _onEditIconPressed(AccountInfo accountInfo) {
    showCosmosActionSheet(
      context: context,
      actions: [
        CosmosModalAction(
          text: 'Rename Account',
          onPressed: () => _onTapRenameAccount(accountInfo),
        ),
        CosmosModalAction(
          text: 'Delete Account',
          onPressed: () => notImplemented(context),
          isCriticalAction: true,
        ),
      ],
      title: Text(accountInfo.name),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isEditingAccountList', isEditingAccountList))
      ..add(IterableProperty<AccountInfo>('accountInfos', accountInfos))
      ..add(IterableProperty<AccountPublicInfo>('publicInfos', publicInfos))
      ..add(DiagnosticsProperty<AccountPublicInfo>('selectedAccount', selectedAccount));
  }
}
