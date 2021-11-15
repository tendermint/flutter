import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosErrorView extends StatelessWidget {
  const CosmosErrorView({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.error,
          ),
          SizedBox(height: CosmosTheme.of(context).spacingM),
          Text(title),
          SizedBox(height: CosmosTheme.of(context).spacingM),
          Text(message),
        ],
      ),
    );
  }
}
