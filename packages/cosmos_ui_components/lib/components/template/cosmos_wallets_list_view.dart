import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosWalletsListView extends StatelessWidget {
  const CosmosWalletsListView({
    required this.list,
    required this.selectedWallet,
    required this.onClicked,
    required this.onEditIconPressed,
    this.isEditing = false,
    Key? key,
  }) : super(key: key);

  final List<WalletInfo> list;
  final WalletInfo selectedWallet;
  final void Function(int) onClicked;
  final void Function(WalletInfo) onEditIconPressed;
  final bool isEditing;

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
                suffix: isEditing
                    ? CosmosImageButton(
                        asset: 'assets/images/more.png',
                        package: packageName,
                        onTap: () => onEditIconPressed(wallet),
                      )
                    : selectedWallet.address == wallet.address
                        ? const CosmosImageButton(
                            asset: 'assets/images/check.png',
                            package: packageName,
                          )
                        : null,
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<void Function(int p1)>.has('onClicked', onClicked))
      ..add(IterableProperty<WalletInfo>('list', list))
      ..add(DiagnosticsProperty<bool>('isEditing', isEditing))
      ..add(ObjectFlagProperty<void Function(WalletInfo p1)>.has('onEditIconPressed', onEditIconPressed))
      ..add(DiagnosticsProperty<WalletInfo>('selectedWallet', selectedWallet));
  }
}

class WalletInfo {
  WalletInfo({
    required this.name,
    required this.address,
    required this.walletId,
  });

  final String name;
  final String address;
  final String walletId;
}
