import 'dart:io';

import 'package:cosmos_ui_components/components/cosmos_bottom_sheet_container.dart';
import 'package:cosmos_ui_components/components/modals/cosmos_modal_action.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> showCosmosActionSheet<T>({
  required BuildContext context,
  Widget? title,
  required List<CosmosModalAction> actions,
  VoidCallback? cancelAction,
}) async {
  return _show<T>(
    context,
    title,
    actions,
    cancelAction,
  );
}

Future<T?> _show<T>(
  BuildContext context,
  Widget? title,
  List<CosmosModalAction> actions,
  VoidCallback? cancelAction,
) {
  if (Platform.isIOS) {
    return _showCupertinoBottomSheet(
      context,
      title,
      actions,
      cancelAction,
    );
  } else {
    return _showMaterialBottomSheet(
      context,
      title,
      actions,
      cancelAction,
    );
  }
}

Future<T?> _showCupertinoBottomSheet<T>(
  BuildContext context,
  Widget? title,
  List<CosmosModalAction> actions,
  VoidCallback? cancelAction,
) {
  final defaultTextStyle = CosmosTextTheme.actionSheetItem;
  return showCupertinoModalPopup(
    context: context,
    builder: (BuildContext buildContext) {
      return CupertinoActionSheet(
        title: title,
        actions: actions.map((action) {
          return Material(
            color: Colors.transparent,
            child: CupertinoActionSheetAction(
              onPressed: action.onPressed,
              child: Text(
                action.text,
                style: defaultTextStyle.copyWith(
                  color: action.isCriticalAction
                      ? CosmosTheme.of(context).colors.actionSheetDestructive
                      : CosmosTheme.of(context).colors.actionSheetPositive,
                ),
              ),
            ),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: cancelAction ?? () => Navigator.of(buildContext).pop(),
          child: Text(
            'Cancel',
            style: defaultTextStyle.copyWith(color: CosmosTheme.of(context).colors.actionSheetPositive),
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}

Future<T?> _showMaterialBottomSheet<T>(
  BuildContext context,
  Widget? title,
  List<CosmosModalAction> actions,
  VoidCallback? cancelAction,
) {
  final defaultTextStyle = CosmosTextTheme.actionSheetItem;
  return showModalBottomSheet<T>(
    backgroundColor: Colors.transparent,
    context: context,
    elevation: 0,
    isScrollControlled: true,
    builder: (BuildContext buildContext) {
      return CosmosBottomSheetContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (title != null) ...[
                Padding(
                  padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
                  child: Center(child: title),
                ),
              ],
              ...actions.map<Widget>((action) {
                return InkWell(
                  onTap: action.onPressed,
                  child: Padding(
                    padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
                    child: Text(
                      action.text,
                      textAlign: TextAlign.center,
                      style: action.isCriticalAction
                          ? defaultTextStyle.copyWith(color: CosmosTheme.of(context).colors.actionSheetDestructive)
                          : defaultTextStyle,
                    ),
                  ),
                );
              }).toList(),
              InkWell(
                onTap: cancelAction ?? () => Navigator.of(buildContext).pop(),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
                    child: DefaultTextStyle(
                      style: defaultTextStyle.copyWith(color: CosmosTheme.of(context).colors.actionSheetDestructive),
                      textAlign: TextAlign.center,
                      child: const Text('Cancel'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
