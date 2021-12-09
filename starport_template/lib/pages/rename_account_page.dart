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
  late String accountName;

  @override
  void initState() {
    super.initState();
    accountName = widget.accountName;
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
                      initialText: accountName,
                      onChanged: (value) {
                        accountName = value;
                        setState(() {});
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
                  SizedBox(height: theme.spacingL + theme.spacingM),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
