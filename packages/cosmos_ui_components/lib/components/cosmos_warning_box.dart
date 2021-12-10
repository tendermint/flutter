import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosWarningBox extends StatelessWidget {
  final String text;
  final String? asset;
  final String? package;

  const CosmosWarningBox({
    Key? key,
    required this.text,
    this.asset,
    this.package,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Container(
      decoration: BoxDecoration(borderRadius: theme.borderRadiusM, border: Border.all(color: theme.colors.divider)),
      child: Padding(
        padding: EdgeInsets.all(theme.spacingL),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Image.asset(
                asset ?? "assets/images/icon_warning.png",
                package: package ?? (asset == null ? packageName : null),
                width: 16,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: theme.spacingL),
            Text(text, style: CosmosTextTheme.copyMinus1Normal),
          ],
        ),
      ),
    );
  }
}
