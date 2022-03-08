import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WalletNamePage extends StatefulWidget {
  const WalletNamePage({
    required this.name,
    this.actionTitle = 'Save',
    Key? key,
  }) : super(key: key);

  final String name;
  final String actionTitle;

  @override
  State<WalletNamePage> createState() => _WalletNamePageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('name', name))
      ..add(StringProperty('actionTitle', actionTitle));
  }
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
  }
}
