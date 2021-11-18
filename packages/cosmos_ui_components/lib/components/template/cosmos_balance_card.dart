import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosBalanceCard extends StatelessWidget {
  final String denomText;
  final String amountDisplayText;

  const CosmosBalanceCard({
    required this.denomText,
    required this.amountDisplayText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: CosmosTheme.of(context).spacingL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 33,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  child: Text(denomText[0].toUpperCase()),
                ),
              ),
              SizedBox(width: CosmosTheme.of(context).spacingM),
              Text(
                denomText,
                // TODO use `CosmosTheme.of(context).textStyles.title0Medium` when implemented
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                amountDisplayText,
                // TODO use `CosmosTheme.of(context).textStyles.title1Medium` when implemented
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: CosmosTheme.of(context).fontSizeS,
                ),
              ),
              SizedBox(height: CosmosTheme.of(context).spacingM),
              Text(
                denomText,
                style: TextStyle(
                  fontSize: CosmosTheme.of(context).fontSizeS,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
