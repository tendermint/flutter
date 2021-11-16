import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

// TODO: Add a parameter for icon
class BalanceCard extends StatelessWidget {
  final String denomText;
  final String amountDisplayText;
  final VoidCallback? onTransferPressed;

  const BalanceCard({
    required this.denomText,
    required this.amountDisplayText,
    required this.onTransferPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        denomText,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      // TODO: Replace with icons from the API
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Text(denomText[0].toUpperCase()),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            amountDisplayText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: CosmosTheme.of(context).fontSizeS,
            ),
          ),
          Text(
            denomText,
            style: TextStyle(
              fontSize: CosmosTheme.of(context).fontSizeS,
            ),
          ),
        ],
      ),
    );
  }
}
