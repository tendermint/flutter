import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChipText extends StatelessWidget {
  const ChipText({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Container(
      padding: EdgeInsets.all(theme.spacingM),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.colors.chipBackground,
      ),
      child: Text(title),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
