import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/pages/create_wallet_page.dart';
import 'package:starport_template/pages/import_wallet_page.dart';
import 'package:starport_template/pages/wallet_name_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class WalletsListSheet extends StatefulWidget {
  const WalletsListSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<WalletsListSheet> createState() => _WalletsListSheetState();
}

class _WalletsListSheetState extends State<WalletsListSheet> {
  List<WalletPublicInfo> get publicInfos => StarportApp.walletsStore.wallets;

  WalletPublicInfo get selectedWallet => StarportApp.walletsStore.selectedWallet;

  List<WalletInfo> get walletInfos => publicInfos
      .map(
        (publicInfo) => WalletInfo(
          name: publicInfo.name,
          address: publicInfo.publicAddress,
          walletId: publicInfo.walletId,
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
              message: 'No wallets found. Add one.',
            ),
            isLoading: StarportApp.walletsStore.isRenamingWallet,
            isEmpty: walletInfos.isEmpty,
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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateWalletPage()));
  }

  void _onTapImportAccount() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ImportWalletPage()));
  }

  Expanded _buildMainList() {
    return Expanded(
      child: Observer(
        builder: (context) => CosmosWalletsListView(
          list: walletInfos,
          selectedWallet: walletInfos.firstWhere((element) => element.address == selectedWallet.publicAddress),
          onClicked: _walletClicked,
          isEditing: isEditingAccountList,
          onEditIconPressed: _onEditIconPressed,
        ),
      ),
    );
  }

  Future<void> _onTapRenameAccount(WalletInfo walletInfo) async {
    final newName = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (context) => WalletNamePage(name: walletInfo.name),
      ),
    );
    if (!mounted) {
      return;
    }
    if (newName != null) {
      Navigator.of(context).pop();
      await _renameWallet(newName);
    }
  }

  Future<void> _renameWallet(String newName) async {
    await StarportApp.walletsStore.renameWallet(newName);
    if (StarportApp.walletsStore.renameWalletFailure != null) {
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

  void _walletClicked(int index) => Navigator.of(context).pop(publicInfos[index]);

  void _onEditIconPressed(WalletInfo walletInfo) {
    showCosmosActionSheet(
      context: context,
      actions: [
        CosmosModalAction(
          text: 'Rename Account',
          onPressed: () => _onTapRenameAccount(walletInfo),
        ),
        CosmosModalAction(
          text: 'Delete Account',
          onPressed: () => notImplemented(context),
          isCriticalAction: true,
        ),
      ],
      title: Text(walletInfo.name),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isEditingAccountList', isEditingAccountList))
      ..add(IterableProperty<WalletInfo>('walletInfos', walletInfos))
      ..add(IterableProperty<WalletPublicInfo>('publicInfos', publicInfos))
      ..add(DiagnosticsProperty<WalletPublicInfo>('selectedWallet', selectedWallet));
  }
}
