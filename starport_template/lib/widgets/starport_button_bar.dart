import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class StarportButtonBar extends StatelessWidget {
  final VoidCallback onSendPressed;
  final VoidCallback onReceivePressed;

  const StarportButtonBar({Key? key, required this.onReceivePressed, required this.onSendPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: CosmosTheme.of(context).spacingL,
        vertical: CosmosTheme.of(context).spacingXL,
      ),
      child: Row(
        children: [
          Expanded(child: CosmosElevatedButton(text: 'Receive', onTap: onReceivePressed)),
          SizedBox(width: CosmosTheme.of(context).spacingL),
          Expanded(child: CosmosElevatedButton(text: 'Send', onTap: onSendPressed)),
        ],
      ),
    );
  }
}
