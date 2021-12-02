import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/pages/sign_transaction_page.dart';

class SignTransactionItem extends StatelessWidget {
  const SignTransactionItem({
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
          Text(text, style: titleS),
          Row(
            children: [
              Text('${amount.toString()} ${balance.denom.text.toUpperCase()}', style: title1Medium),
              SizedBox(width: theme.spacingL),
              CosmosTokenAvatar(text: balance.denom.text),
            ],
          ),
        ],
      ),
    );
  }
}
