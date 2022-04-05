import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChipText extends StatelessWidget {
  const ChipText({
    required this.title,
    this.style,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);
  final String title;
  final TextStyle? style;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Container(
      padding: EdgeInsets.all(theme.spacingM),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor ?? theme.colors.chipBackground,
      ),
      child: Text(
        title,
        style: style,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(DiagnosticsProperty<TextStyle?>('style', style))
      ..add(ColorProperty('backgroundColor', backgroundColor));
  }
}
