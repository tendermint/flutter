import 'dart:math';

import 'package:cosmos_ui_components/cosmos_app_theme.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final String denomText;
  final String amountDisplayText;
  final VoidCallback? onTransferPressed;

  const BalanceCard({
    required this.denomText,
    required this.amountDisplayText,
    required this.onTransferPressed,
  });

  // TODO: Remove these icons during refactor
  // ignore: avoid_field_initializers_in_const_classes
  final List<Widget> icons = const [
    Icon(Icons.wifi_tethering),
    Icon(Icons.workspaces_filled),
    Icon(Icons.workspaces_filled),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: CosmosAppTheme.elevationS,
      child: ListTile(
        title: Text(denomText),
        subtitle: Text(amountDisplayText),
        // TODO: Fix this during refactor
        leading: icons[Random().nextInt(2)],
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          onPressed: onTransferPressed,
          child: const Text('Transfer'),
        ),
      ),
    );
  }
}
