import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/balance.dart';

class SignTransactionTabViewItem extends StatelessWidget {
  const SignTransactionTabViewItem({
    Key? key,
    required this.text,
    required this.balance,
    required this.amount,
  }) : super(key: key);

  final String text;
  final double amount;
  final Balance balance;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: CosmosTextTheme.titleS),
          const Spacer(),
          Text('${amount.toString()} ${balance.denom.text.toUpperCase()}', style: CosmosTextTheme.title1Medium),
          SizedBox(width: theme.spacingL),
          CosmosTokenAvatar(text: balance.denom.text),
        ],
      ),
    );
  }
}
