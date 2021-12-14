import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class TransactionHistoryGroupTitle extends StatelessWidget {
  final String title;

  const TransactionHistoryGroupTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
      child: Text(title, style: CosmosTextTheme.title0Bold),
    );
  }
}
