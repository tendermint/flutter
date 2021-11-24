import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosBottomSheetHeader extends StatelessWidget {
  final String title;

  const CosmosBottomSheetHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: CosmosTheme.of(context).spacingM),
        Row(
          children: [
            SizedBox(width: CosmosTheme.of(context).spacingM),
            Text(
              title,
              style: CosmosTextTheme.title1Bold,
            ),
            SizedBox(width: CosmosTheme.of(context).spacingM),
          ],
        ),
      ],
    );
  }
}
