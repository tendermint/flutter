import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadingSplash extends StatelessWidget {
  const LoadingSplash({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: CosmosTheme.of(context).spacingM),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: CosmosTheme.of(context).colors.text,
              ),
              SizedBox(height: CosmosTheme.of(context).spacingL),
              Text(
                text,
                textAlign: TextAlign.center,
                style: CosmosTextTheme.title2Bold,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text));
  }
}
