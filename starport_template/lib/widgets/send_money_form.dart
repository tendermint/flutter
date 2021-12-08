import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class SendMoneyForm extends StatefulWidget {
  final Function(String) onAddressChanged;
  final Function(String) onAmountChanged;
  final Function(String) onFeeChanged;
  final String denomText;

  const SendMoneyForm({
    Key? key,
    required this.onAddressChanged,
    required this.onAmountChanged,
    required this.onFeeChanged,
    required this.denomText,
  }) : super(key: key);

  @override
  State<SendMoneyForm> createState() => _SendMoneyFormState();
}

class _SendMoneyFormState extends State<SendMoneyForm> {
  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
      child: Column(
        children: [
          CosmosTextField(
            onChanged: (value) => widget.onAddressChanged(value),
            hint: "Enter receiver's wallet address",
          ),
          SizedBox(height: theme.spacingL),
          CosmosTextField(
            onChanged: (value) => widget.onAmountChanged(value),
            keyboardType: TextInputType.number,
            hint: '0 ${widget.denomText.toUpperCase()}',
          ),
        ],
      ),
    );
  }
}
