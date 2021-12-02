import 'package:cosmos_ui_components/components/cosmos_image_button.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';

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
    this.isEditing = false,
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
