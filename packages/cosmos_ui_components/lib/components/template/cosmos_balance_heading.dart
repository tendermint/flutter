import 'package:cosmos_ui_components/cosmos_app_theme.dart';
import 'package:flutter/material.dart';

class BalanceHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: CosmosAppTheme.spacingXS,
        horizontal: CosmosAppTheme.spacingM,
      ),
      child: Row(
        children: [
          Text(
            'Balances',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            margin: const EdgeInsets.only(left: CosmosAppTheme.spacingS),
            padding:
                const EdgeInsets.symmetric(horizontal: CosmosAppTheme.spacingM, vertical: CosmosAppTheme.spacingXS),
            decoration:
                BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(CosmosAppTheme.radiusL)),
            child: const Text(
              'Cosmos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: CosmosAppTheme.fontSizeS,
              ),
            ),
          )
        ],
      ),
    );
  }
}
