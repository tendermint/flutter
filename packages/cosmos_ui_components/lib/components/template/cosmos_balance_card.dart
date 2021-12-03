import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosBalanceCard extends StatelessWidget {
  final String denomText;
  final String amountDisplayText;
  final String secondaryText;
  final VoidCallback? onTap;
  final bool isListTileType;

  const CosmosBalanceCard({
    required this.denomText,
    required this.amountDisplayText,
    this.isListTileType = false,
    this.secondaryText = 'available',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: CosmosTheme.of(context).spacingL),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CosmosTokenAvatar(text: denomText),
                    SizedBox(width: CosmosTheme.of(context).spacingM),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(denomText, style: CosmosTextTheme.title0Medium),
                        if (isListTileType)
                          Text(
                            '$amountDisplayText ${denomText.toUpperCase()}',
                            style: CosmosTextTheme.copyMinus1Normal,
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            if (!isListTileType)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(amountDisplayText, style: CosmosTextTheme.labelS),
                  Text('$secondaryText ${denomText.toUpperCase()}', style: CosmosTextTheme.copyMinus1Normal),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
