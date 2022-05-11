import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/pages/transfer_asset_page.dart';
import 'package:starport_template/widgets/balance_card_list.dart';

class SelectAssetPage extends StatelessWidget {
  const SelectAssetPage({
    required this.balancesList,
    Key? key,
  }) : super(key: key);

  final List<Balance> balancesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CosmosAppBar(leading: CosmosBackButton(), title: 'Select Asset'),
      body: Padding(
        padding: EdgeInsets.only(top: CosmosTheme.of(context).spacingXXL),
        child: BalanceCardList(
          balancesList: balancesList,
          onTapItem: (balance) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransferAssetPage(balance: balance)));
          },
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Balance>('balancesList', balancesList));
  }
}
