import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/starport_app.dart';

class RenameAccountPage extends StatefulWidget {
  final String accountName;

  const RenameAccountPage({Key? key, required this.accountName}) : super(key: key);

  @override
  State<RenameAccountPage> createState() => _RenameAccountPageState();
}

class _RenameAccountPageState extends State<RenameAccountPage> {
  String get accountName => StarportApp.walletsStore.accountName;

  @override
  void initState() {
    super.initState();
    StarportApp.walletsStore.accountName = widget.accountName;
  }

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Scaffold(
      appBar: const CosmosAppBar(
        leading: CosmosBackButton(),
        title: 'Name your account',
      ),
      body: Observer(
        builder: (context) {
          return ContentStateSwitcher(
            isLoading: StarportApp.walletsStore.isRenamingWallet,
            isError: StarportApp.walletsStore.renameWalletFailure.value != null,
            errorChild: const CosmosErrorView(
              title: "Something went wrong",
              message: "We had problems renaming your account.",
            ),
            contentChild: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: theme.spacingL, vertical: theme.spacingM),
                    child: CosmosTextField(
                      text: accountName,
                      onChanged: (value) {
                        StarportApp.walletsStore.accountName = value;
                      },
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
                    child: Row(
                      children: [
                        Expanded(
                          child: CosmosElevatedButton(
                            text: 'Save',
                            onTap:
                                accountName.isEmpty ? null : () => StarportApp.walletsStore.renameWallet(accountName),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: theme.spacingL),
                  SizedBox(height: theme.spacingM),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CosmosTextField extends StatefulWidget {
  final String text;
  final Function(String) onChanged;
  final int? maxLines;
  final int maxLength;

  const CosmosTextField({
    Key? key,
    required this.onChanged,
    this.maxLength = 50,
    this.text = '',
    this.maxLines,
  }) : super(key: key);

  @override
  State<CosmosTextField> createState() => _CosmosTextFieldState();
}

class _CosmosTextFieldState extends State<CosmosTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return TextField(
      controller: controller,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        counterText: '',
        suffix: SizedBox(
          height: 17,
          width: 17,
          child: CircleAvatar(
            backgroundColor: theme.colors.divider,
            foregroundColor: theme.colors.background,
            child: InkWell(
              onTap: () {
                controller.clear();
                widget.onChanged('');
              },
              child: const Icon(Icons.clear, size: 12),
            ),
          ),
        ),
      ),
    );
  }
}
