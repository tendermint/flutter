import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosCircleTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final IconData icon;

  const CosmosCircleTextButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
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
            CircleAvatar(
              // TODO: There needs to be a radius that matches the size in the design provided in Figma
              maxRadius: 12,
              minRadius: 12,
              backgroundColor: isEnabled ? theme.colors.text : theme.colors.inactive,
              foregroundColor: Colors.white,
              child: Icon(icon, size: theme.fontSizeM),
            ),
            SizedBox(width: theme.spacingL),
            Text(text, style: isEnabled ? null : TextStyle(color: theme.colors.inactive)),
          ],
        ),
      ),
    );
  }
}
