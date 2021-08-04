import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';

class CosmosWalletsListView extends StatelessWidget {
  final List<WalletInfo> list;
  final void Function(int) onClicked;

  const CosmosWalletsListView({
    Key? key,
    required this.list,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list
          .mapIndexed(
            (index, wallet) => CosmosWalletListItem(
              name: wallet.name,
              address: wallet.address,
              onClicked: () => onClicked(index),
            ),
          )
          .toList(),
    );
  }
}

class WalletInfo {
  final String name;
  final String address;

  WalletInfo({
    required this.name,
    required this.address,
  });
}
