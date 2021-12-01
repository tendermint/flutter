import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosCircleTextButton extends StatelessWidget {
  final String text;
  final String asset;
  final VoidCallback? onTap;

  const CosmosCircleTextButton({
    Key? key,
    required this.text,
    required this.asset,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    final isEnabled = onTap != null;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacingL,
        vertical: theme.spacingM,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  asset,
                  color: isEnabled ? null : theme.colors.inactive,
                  colorBlendMode: BlendMode.dstATop,
                ),
              ),
            ),
            SizedBox(width: theme.spacingL),
            Text(text, style: isEnabled ? null : TextStyle(color: theme.colors.inactive)),
          ],
        ),
      ),
    );
  }
}
