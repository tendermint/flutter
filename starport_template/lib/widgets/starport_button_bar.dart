import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StarportButtonBar extends StatelessWidget {
  const StarportButtonBar({
    required this.onReceivePressed,
    required this.onSendPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onSendPressed;
  final VoidCallback onReceivePressed;

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback>.has('onSendPressed', onSendPressed))
      ..add(ObjectFlagProperty<VoidCallback>.has('onReceivePressed', onReceivePressed));
  }
}
