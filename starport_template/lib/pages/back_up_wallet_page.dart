import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/pages/repeat_mnemonic_page.dart';
import 'package:starport_template/widgets/copy_to_clipboard_button.dart';

class BackUpWalletPage extends StatefulWidget {
  const BackUpWalletPage({
    required this.mnemonic,
    Key? key,
  }) : super(key: key);

  final String mnemonic;

  @override
  State<BackUpWalletPage> createState() => _BackUpWalletPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('mnemonic', mnemonic));
  }
}

class _BackUpWalletPageState extends State<BackUpWalletPage> {
  List<String> get mnemonicWords => widget.mnemonic.splitToWords();
  var _confirmChecked = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ContentStateSwitcher(
        contentChild: Scaffold(
          body: _contentUI(),
          appBar: _appBar(),
        ),
      ),
    );
  }

  CosmosAppBar _appBar() {
    return CosmosAppBar(
      leading: const CosmosBackButton(),
      title: 'Your recovery phrase',
      actions: [
        CosmosAppBarAction(
          onTap: _onTapAdvanced,
          text: 'Advanced',
        ),
      ],
    );
  }

  void _onTapAdvanced() => notImplemented(context);

  Widget _contentUI() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CosmosTheme.of(context).spacingL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: CosmosTheme.of(context).spacingM),
            Text(
              'Please write down your 24 words in a safe space manually on paper.',
              style: CosmosTextTheme.copy0Normal,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: CosmosTheme.of(context).spacingXL),
                    Padding(
                      padding: EdgeInsets.only(right: CosmosTheme.of(context).spacingL),
                      child: CosmosMnemonicWordsGrid(mnemonicWords: mnemonicWords),
                    ),
                    SizedBox(height: CosmosTheme.of(context).spacingL),
                  ],
                ),
              ),
            ),
            SizedBox(height: CosmosTheme.of(context).spacingM),
            CopyToClipboardButton(
              copyData: widget.mnemonic,
            ),
            SizedBox(height: CosmosTheme.of(context).spacingM),
            CosmosCheckboxTile(
              text:
                  'I have backed up my recovery phrase, I understand that if I lose my recovery phrase, I will lose my fund',
              onTap: _onTapConfirmCheckbox,
              checked: _confirmChecked,
            ),
            SizedBox(height: CosmosTheme.of(context).spacingL),
            CosmosElevatedButton(
              text: 'Continue',
              onTap: _confirmChecked ? _onTapContinue : null,
            ),
            const MinimalBottomSpacer(),
          ],
        ),
      ),
    );
  }

  void _onTapContinue() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RepeatMnemonicPage(mnemonic: widget.mnemonic),
        ),
      );

  void _onTapConfirmCheckbox() => setState(
        () => _confirmChecked = !_confirmChecked,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<String>('mnemonicWords', mnemonicWords));
  }
}
