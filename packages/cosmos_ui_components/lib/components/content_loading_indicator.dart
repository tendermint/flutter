import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContentLoadingIndicator extends StatelessWidget {
  const ContentLoadingIndicator({
    Key? key,
    this.message = '',
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: CosmosTheme.of(context).colors.text),
          SizedBox(height: CosmosTheme.of(context).spacingM),
          if (message.isNotEmpty) Text(message),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('message', message));
  }
}
