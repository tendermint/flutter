import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WalletNamePage extends StatefulWidget {
  final String name;
  final String actionTitle;

  const WalletNamePage({
    Key? key,
    required this.name,
    this.actionTitle = "Save",
  }) : super(key: key);

  @override
  State<WalletNamePage> createState() => _WalletNamePageState();
}

class _WalletNamePageState extends State<WalletNamePage> {
  late String name;

  @override
  void initState() {
    super.initState();
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Scaffold(
      appBar: const CosmosAppBar(
        leading: CosmosBackButton(),
        title: 'Name your account',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacingL, vertical: theme.spacingM),
              child: CosmosTextField(
                initialText: name,
                maxLength: 50,
                onChanged: _onNameChanged,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
              child: Row(
                children: [
                  Expanded(
                    child: CosmosElevatedButton(
                      text: widget.actionTitle,
                      onTap: name.isEmpty ? null : _onTapSave,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: theme.spacingL + theme.spacingM),
          ],
        ),
      ),
    );
  }

  void _onTapSave() {
    Navigator.of(context).pop(name);
  }

  void _onNameChanged(String value) => setState(() {
        name = value;
      });
}
