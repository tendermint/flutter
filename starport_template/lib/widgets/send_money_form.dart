import 'package:clipboard/clipboard.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class SendMoneyForm extends StatefulWidget {
  final Function(String) onAddressChanged;
  final Function(String) onAmountChanged;
  final String denomText;

  const SendMoneyForm({
    Key? key,
    required this.onAddressChanged,
    required this.onAmountChanged,
    required this.denomText,
  }) : super(key: key);

  @override
  State<SendMoneyForm> createState() => _SendMoneyFormState();
}

class _SendMoneyFormState extends State<SendMoneyForm> {
  String text = '';
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
      child: Column(
        children: [
          CosmosTextField(
            controller: controller,
            onChanged: widget.onAddressChanged,
            initialText: text,
            hint: "Enter receiver's wallet address",
            suffix: CosmosTextButton(
              onTap: _onTapPaste,
              text: 'Paste',
              color: CosmosTheme.of(context).colors.link,
            ),
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

  Future<void> _onTapPaste() async {
    final value = await FlutterClipboard.paste();
    setState(() => controller.text = value);
  }
}
