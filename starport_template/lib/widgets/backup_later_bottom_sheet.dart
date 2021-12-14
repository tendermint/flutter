import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BackupLaterBottomSheet extends StatefulWidget {
  const BackupLaterBottomSheet({
    required this.onTapSkipBackup,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTapSkipBackup;

  @override
  State<BackupLaterBottomSheet> createState() => _BackupLaterBottomSheetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>.has('onTapSkipBackup', onTapSkipBackup));
  }
}

class _BackupLaterBottomSheetState extends State<BackupLaterBottomSheet> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return CosmosBottomSheetContainer(
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              CosmosBottomSheetHeader(title: 'Back up later', titleTextStyle: CosmosTextTheme.title1Bold),
              SizedBox(height: theme.spacingXL),
              CosmosCheckboxTile(
                text:
                    'I understand if I don’t back up my account, or if I lose my recovery phrase, I might lose my fund',
                checked: checked,
                onTap: () => setState(() => checked = !checked),
              ),
              SizedBox(height: theme.spacingXL),
              CosmosElevatedButton(
                text: 'Continue',
                onTap: checked
                    ? () {
                        Navigator.of(context).pop();
                        widget.onTapSkipBackup();
                      }
                    : null,
              ),
              SizedBox(height: theme.spacingM),
              CosmosTextButton(
                text: 'Back',
                onTap: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: theme.spacingL),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('checked', checked));
  }
}
