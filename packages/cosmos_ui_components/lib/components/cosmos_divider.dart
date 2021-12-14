import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosDivider extends StatelessWidget {
  const CosmosDivider({Key? key, this.edgeInsets}) : super(key: key);

  final EdgeInsets? edgeInsets;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: edgeInsets ?? EdgeInsets.symmetric(horizontal: theme.spacingL),
      child: Divider(color: theme.colors.inputBorder),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<EdgeInsets?>('edgeInsets', edgeInsets));
  }
}
