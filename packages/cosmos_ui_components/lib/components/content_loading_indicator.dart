import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class ContentLoadingIndicator extends StatelessWidget {
  final String message;

  const ContentLoadingIndicator({
    Key? key,
    this.message = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: CosmosTheme.of(context).spacingM),
          if (message.isNotEmpty) Text(message),
        ],
      ),
    );
  }
}
