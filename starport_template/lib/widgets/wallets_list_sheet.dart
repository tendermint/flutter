import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/components/template/cosmos_action_sheet.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/extensions.dart';
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

  bool get isEditingAccountList => StarportApp.walletsStore.isEditingAccountList;

  @override
  void initState() {
    super.initState();
    StarportApp.walletsStore.isEditingAccountList = false;
  }

  @override
  Widget build(BuildContext context) {
    //ignore: deprecated_member_use_from_same_package
    final theme = CosmosTheme.of(context);
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
                    onTap: () => StarportApp.walletsStore.isEditingAccountList = !isEditingAccountList,
                  ),
                  actions: [CosmosTextButton(text: 'Close', onTap: () => Navigator.of(context).pop())],
                ),
                SizedBox(height: theme.spacingL),
                _buildMainList(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CosmosTheme.of(context).spacingL,
                    vertical: CosmosTheme.of(context).spacingM,
                  ),
                  child: const Divider(),
                ),
                SizedBox(height: theme.spacingL),
                CosmosCircleTextButton(
                  onTap: () {},
                  text: 'Create account',
                  icon: Icons.add,
                  isEnabled: !isEditingAccountList,
                ),
                CosmosCircleTextButton(
                  onTap: () {},
                  text: 'Import account',
                  icon: Icons.arrow_downward_sharp,
                  isEnabled: !isEditingAccountList,
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RenameAccountPage()));
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

class CosmosWalletsListView extends StatelessWidget {
  final List<WalletInfo> list;
  final WalletInfo selectedWallet;
  final void Function(int) onClicked;
  final void Function(WalletInfo) onEditIconPressed;
  final bool isEditing;

  const CosmosWalletsListView({
    Key? key,
    required this.list,
    required this.selectedWallet,
    required this.onClicked,
    required this.isEditing,
    required this.onEditIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: list
            .mapIndexed(
              (index, wallet) => CosmosWalletListItem(
                name: wallet.name,
                address: wallet.address,
                isSelected: selectedWallet.address == wallet.address,
                onClicked: () => onClicked(index),
                isEditing: isEditing,
                onEditIconPressed: (address) =>
                    onEditIconPressed(list.firstWhere((element) => element.address == address)),
              ),
            )
            .toList(),
      ),
    );
  }
}

class WalletInfo {
  final String name;
  final String address;
  final String walletId;

  WalletInfo({
    required this.name,
    required this.address,
    required this.walletId,
  });
}

// import 'package:cosmos_ui_components/components/gradient_avatar.dart';
// import 'package:cosmos_ui_components/cosmos_theme.dart';
// import 'package:flutter/material.dart';

class CosmosWalletListItem extends StatelessWidget {
  final String name;
  final String address;
  final bool isSelected;
  final bool isEditing;
  final VoidCallback onClicked;
  final Function(String) onEditIconPressed;

  const CosmosWalletListItem({
    Key? key,
    required this.name,
    required this.address,
    required this.isSelected,
    required this.onClicked,
    required this.isEditing,
    required this.onEditIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return InkWell(
      onTap: onClicked,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(theme.spacingL),
            margin: EdgeInsets.symmetric(
              horizontal: theme.spacingL,
              vertical: theme.spacingM,
            ),
            decoration: BoxDecoration(
              borderRadius: theme.borderRadiusM,
              // TODO: This color needs to be fixed. Doesn't match the dark theme.
              border: Border.all(color: isSelected ? Colors.black12 : Colors.transparent),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: theme.spacingM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(height: 32, child: GradientAvatar(stringKey: address)),
                      SizedBox(width: theme.spacingM),
                      // TODO: Add text styles from `CosmosTheme.of(context)`
                      Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  if (isEditing)
                    CosmosEditButton(onPressed: () => onEditIconPressed(address))
                  else if (isSelected)
                    const Icon(Icons.check_circle_outline),
                ],
              ),
            ),
          ),
          SizedBox(height: theme.spacingL),
        ],
      ),
    );
  }
}

class CosmosEditButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CosmosEditButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: SizedBox(
        height: 24,
        width: 24,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CosmosTheme.of(context).colors.text, width: 2),
          ),
          child: CircleAvatar(
            backgroundColor: CosmosTheme.of(context).colors.background,
            foregroundColor: CosmosTheme.of(context).colors.text,
            child: const Icon(Icons.more_horiz, size: 16),
          ),
        ),
      ),
    );
  }
}

class CosmosCircleTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  final bool isEnabled;

  const CosmosCircleTextButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacingL,
        vertical: theme.spacingM,
      ),
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        child: Row(
          children: [
            CircleAvatar(
              // TODO: There needs to be a radius that matches the size in the design provided in Figma
              maxRadius: 12,
              minRadius: 12,
              // TODO: Pick up these colors from `CosmosTheme.of(context).colors`
              backgroundColor: isEnabled ? Colors.black : theme.colors.inactive,
              foregroundColor: Colors.white,
              child: Icon(icon, size: theme.fontSizeM),
            ),
            SizedBox(width: theme.spacingL),
            Text(text, style: isEnabled ? null : TextStyle(color: theme.colors.inactive)),
          ],
        ),
      ),
    );
  }
}

class CosmosBottomSheetHeader extends StatelessWidget {
  final String title;
  final TextStyle titleTextStyle;
  final Widget? leading;
  final Widget? leadingIcon;
  final List<Widget>? actions;

  const CosmosBottomSheetHeader({
    Key? key,
    required this.title,
    required this.titleTextStyle,
    this.leading,
    this.actions,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isExtended = leading != null || actions != null;
    final theme = CosmosTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isExtended)
          Padding(
            padding: EdgeInsets.only(right: theme.spacingM, top: theme.spacingL),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (leading != null)
                  Row(
                    children: [
                      if (leadingIcon != null)
                        Padding(padding: EdgeInsets.only(left: theme.spacingL), child: leadingIcon),
                      leading!,
                    ],
                  ),
                if (actions != null) ...actions!
              ],
            ),
          ),
        if (isExtended)
          Column(children: [SizedBox(height: theme.spacingM), SizedBox(height: theme.spacingL)])
        else
          SizedBox(height: theme.spacingXXL),
        Padding(
          padding: EdgeInsets.only(left: theme.spacingM),
          child: Row(
            children: [
              SizedBox(width: theme.spacingM),
              Text(title, style: titleTextStyle),
              SizedBox(width: theme.spacingM),
            ],
          ),
        ),
      ],
    );
  }
}
