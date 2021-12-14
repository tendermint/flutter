import 'package:cosmos_ui_components/components/template/cosmos_balance_card.dart';
import 'package:cosmos_ui_components/models/balance.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosBalancesListView extends StatelessWidget {
  const CosmosBalancesListView({
    required this.list,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  final List<Balance> list;
  final void Function(int) onClicked;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list
          .mapIndexed(
            (index, balance) => CosmosBalanceCard(
              denomText: balance.denomText,
              amountDisplayText: balance.amountDisplayText,
              secondaryText: 'available ${balance.denomText.toUpperCase()}',
            ),
          )
          .toList(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<Balance>('list', list))
      ..add(ObjectFlagProperty<void Function(int p1)>.has('onClicked', onClicked));
  }
}
