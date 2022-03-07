import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_ui_components/models/account_info.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosAccountsListView extends StatelessWidget {
  const CosmosAccountsListView({
    required this.list,
    required this.selectedAccount,
    required this.onClicked,
    required this.onEditIconPressed,
    this.isEditing = false,
    Key? key,
  }) : super(key: key);

  final List<AccountInfo> list;
  final AccountInfo selectedAccount;
  final void Function(int) onClicked;
  final void Function(AccountInfo) onEditIconPressed;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: list
            .mapIndexed(
              (index, account) => CosmosAccountListItem(
                name: account.name,
                address: account.address,
                isSelected: selectedAccount.address == account.address,
                onClicked: () => onClicked(index),
                suffix: isEditing
                    ? CosmosImageButton(
                        asset: 'assets/images/more.png',
                        package: packageName,
                        onTap: () => onEditIconPressed(account),
                      )
                    : selectedAccount.address == account.address
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
      ..add(IterableProperty<AccountInfo>('list', list))
      ..add(DiagnosticsProperty<bool>('isEditing', isEditing))
      ..add(ObjectFlagProperty<void Function(AccountInfo p1)>.has('onEditIconPressed', onEditIconPressed))
      ..add(DiagnosticsProperty<AccountInfo>('selectedAccount', selectedAccount));
  }
}
