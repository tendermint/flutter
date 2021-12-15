import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class BalanceHeading extends StatelessWidget {
  const BalanceHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: CosmosTheme.of(context).spacingXS,
        horizontal: CosmosTheme.of(context).spacingM,
      ),
      child: Row(
        children: [
          Text(
            'Balances',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            margin: EdgeInsets.only(left: CosmosTheme.of(context).spacingS),
            padding: EdgeInsets.symmetric(
              horizontal: CosmosTheme.of(context).spacingM,
              vertical: CosmosTheme.of(context).spacingXS,
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(CosmosTheme.of(context).radiusXL),
            ),
            child: Text(
              'Cosmos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: CosmosTheme.of(context).fontSizeS,
              ),
            ),
          )
        ],
      ),
    );
  }
}
