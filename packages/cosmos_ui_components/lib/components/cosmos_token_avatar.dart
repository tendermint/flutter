import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosTokenAvatar extends StatelessWidget {
  const CosmosTokenAvatar({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

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
