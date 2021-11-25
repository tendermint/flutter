import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';

Future showCosmosAdaptiveActionSheet(
  BuildContext context, {
  required String title,
  required List<CosmosActionSheetItem> actions,
  String cancelText = 'Cancel',
}) async =>
    showAdaptiveActionSheet(
      context: context,
      title: Text(title),
      actions: actions
          .map(
            (e) => BottomSheetAction(
              title: Text(e.text, style: TextStyle(color: e.isCriticalAction ? Colors.red : Colors.blue)),
              onPressed: e.onPressed,
            ),
          )
          .toList(),
      cancelAction: CancelAction(
        title: Text(cancelText, style: const TextStyle(color: Colors.blue)),
      ), // onPressed parameter is optional by default will dismiss the ActionSheet
    );

class CosmosActionSheetItem {
  final String text;
  final VoidCallback onPressed;
  final bool isCriticalAction;

  CosmosActionSheetItem({required this.text, required this.onPressed, this.isCriticalAction = false});
}
