import 'package:cosmos_ui_components/components/cosmos_bottom_sheet_container.dart';
import 'package:cosmos_ui_components/components/cosmos_bottom_sheet_header.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class BackupLaterBottomSheet extends StatefulWidget {
  final VoidCallback onTapSkipBackup;

  const BackupLaterBottomSheet({
    Key? key,
    required this.onTapSkipBackup,
  }) : super(key: key);

  @override
  State<BackupLaterBottomSheet> createState() => _BackupLaterBottomSheetState();
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
              const CosmosBottomSheetHeader(
                title: "Back up later",
              ),
              SizedBox(height: theme.spacingXL),
              CosmosCheckboxTile(
                text:
                    'I understand if I don’t back up my account, or if I lose my recovery phrase, I might lose my fund',
                checked: checked,
                onTap: () => setState(() => checked = !checked),
              ),
              SizedBox(height: theme.spacingXL),
              CosmosElevatedButton(
                text: "Continue",
                onTap: checked
                    ? () {
                        Navigator.of(context).pop();
                        widget.onTapSkipBackup();
                      }
                    : null,
              ),
              SizedBox(height: theme.spacingM),
              CosmosTextButton(
                text: "Back",
                onTap: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: theme.spacingL),
            ],
          ),
        ),
      ),
    );
  }
}
