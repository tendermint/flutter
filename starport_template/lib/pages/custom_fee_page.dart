import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/utils/amount_validator.dart';

class CustomFeePage extends StatefulWidget {
  final String denomText;
  final double? initialFee;

  const CustomFeePage({Key? key, required this.denomText, this.initialFee}) : super(key: key);

  @override
  State<CustomFeePage> createState() => _CustomFeePageState();
}

class _CustomFeePageState extends State<CustomFeePage> {
  double fee = 0.0;

  @override
  void initState() {
    super.initState();
    fee = widget.initialFee ?? StarportApp.walletsStore.defaultFee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CosmosAppBar(
        title: 'Custom Fee',
        leading: CosmosBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CosmosTheme.of(context).spacingL),
          child: Column(
            children: [
              CosmosTextField(
                initialText: fee.toString(),
                onChanged: _onFeeChanged,
                hint: '0 ${widget.denomText.toUpperCase()}',
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CosmosElevatedButton(
                      onTap: fee == 0.0 ? null : _onTapSave,
                      text: 'Save',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSave() => Navigator.of(context).pop(fee);

  void _onFeeChanged(String value) {
    fee = validateAmount(value);
    setState(() {});
  }
}