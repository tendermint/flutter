import 'package:cosmos_ui_components/components/cosmos_text_button.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosAppBarAction extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CosmosAppBarAction({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacingS,
      ),
      child: CosmosTextButton(
        onTap: onTap,
        text: text,
        color: theme.colors.onBackground,
      ),
    );
  }
}
