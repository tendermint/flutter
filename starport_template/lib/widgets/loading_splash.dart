import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class LoadingSplash extends StatelessWidget {
  final String text;

  const LoadingSplash({
    Key? key,
    required this.text,
  }) : super(key: key);

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
}
