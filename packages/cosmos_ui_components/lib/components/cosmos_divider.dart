import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosDivider extends StatelessWidget {
  final EdgeInsets? edgeInsets;
  const CosmosDivider({Key? key, this.edgeInsets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: edgeInsets ?? EdgeInsets.symmetric(horizontal: theme.spacingL),
      child: Divider(color: theme.colors.inputBorder),
    );
  }
}
