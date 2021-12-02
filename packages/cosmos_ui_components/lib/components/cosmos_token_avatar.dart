import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosTokenAvatar extends StatelessWidget {
  final String text;

  const CosmosTokenAvatar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return SizedBox(
      height: 32,
      child: CircleAvatar(
        backgroundColor: theme.colors.avatarBg,
        foregroundColor: theme.colors.text,
        child: Text(text[0].toUpperCase()),
      ),
    );
  }
}
