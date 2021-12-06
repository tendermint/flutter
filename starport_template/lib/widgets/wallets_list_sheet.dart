import 'package:cosmos_ui_components/components/empty_list_message.dart';
import 'package:cosmos_ui_components/components/template/cosmos_action_sheet.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/pages/rename_account_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class WalletsListSheet extends StatefulWidget {
  const WalletsListSheet({
    Key? key,
  }) : super(key: key);

  @override
  _WalletsListSheetState createState() => _WalletsListSheetState();
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
              message: "No wallets found. Add one.",
            ),
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
                  onTap: isEditingAccountList ? null : () {},
                  text: 'Create account',
                  asset: 'assets/images/plus_circle.png',
                ),
                CosmosCircleTextButton(
                  onTap: isEditingAccountList ? null : () {},
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

  Expanded _buildMainList() {
    return Expanded(
      child: CosmosWalletsListView(
        list: walletInfos,
        selectedWallet: walletInfos.firstWhere((element) => element.address == selectedWallet.publicAddress),
        onClicked: (index) => _walletClicked(index),
        isEditing: isEditingAccountList,
        onEditIconPressed: (walletInfo) {
          showCosmosActionSheet(
            context: context,
            actions: [
              CosmosActionSheetItem(
                text: 'Rename Account',
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => RenameAccountPage(accountName: walletInfo.name)));
                },
              ),
              CosmosActionSheetItem(text: 'Delete Account', onPressed: () {}, isCriticalAction: true),
            ],
            title: Text(walletInfo.name),
          );
        },
      ),
    );
  }

  void _walletClicked(int index) => Navigator.of(context).pop(publicInfos[index]);
}
