import 'package:cosmos_ui_components/components/cosmos_app_bar.dart';
import 'package:cosmos_ui_components/components/cosmos_back_button.dart';
import 'package:cosmos_ui_components/components/cosmos_elevated_button.dart';
import 'package:cosmos_ui_components/components/cosmos_text_field.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/utils/amount_validator.dart';

class CustomFeePage extends StatefulWidget {
  final String denomText;
  final double initialFee;

  const CustomFeePage({Key? key, required this.denomText, this.initialFee = 0.02}) : super(key: key);

  @override
  State<CustomFeePage> createState() => _CustomFeePageState();
}

class _CustomFeePageState extends State<CustomFeePage> {
  double fee = 0.0;

  @override
  void initState() {
    super.initState();
    fee = widget.initialFee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CosmosAppBar(
        title: 'Custom Fee',
        leading: CosmosBackButton(onTap: () => Navigator.of(context).pop(fee)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CosmosTheme.of(context).spacingL),
          child: Column(
            children: [
              CosmosTextField(
                text: fee.toString(),
                onChanged: (value) {
                  fee = validateAmount(value);
                  setState(() {});
                },
                hint: '0 ${widget.denomText.toUpperCase()}',
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CosmosElevatedButton(
                      onTap: fee == 0.0 ? null : () => Navigator.of(context).pop(fee),
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
}
