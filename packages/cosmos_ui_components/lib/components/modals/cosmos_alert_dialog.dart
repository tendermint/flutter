import 'package:cosmos_ui_components/components/modals/platform_check.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef DialogBuilder = CosmosAlertDialog Function(BuildContext);

Future<T?> showCosmosAlertDialog<T>({
  required BuildContext context,
  required DialogBuilder dialogBuilder,
  OSProvider osProvider = defaultOSProvider,
}) {
  final system = osProvider();
  switch (system) {
    case OS.iOS:
      return cupertino.showCupertinoDialog(
          context: context, builder: dialogBuilder);
    case OS.Android:
    case OS.Other:
      return showDialog(context: context, builder: dialogBuilder);
  }
}

class CosmosAlertDialog extends StatelessWidget {
  const CosmosAlertDialog({
    Key? key,
    this.osProvider = defaultOSProvider,
    this.title,
    this.message,
    this.actions = const [],
  }) : super(key: key);

  final OSProvider osProvider;
  final String? title;
  final String? message;
  final List<CosmosModalAction> actions;

  @override
  Widget build(BuildContext context) {
    final os = osProvider();
    switch (os) {
      case OS.iOS:
        return _iosAlert(context);
      case OS.Android:
      case OS.Other:
        return _androidAlertDialog(context);
    }
  }

  Widget _iosAlert(BuildContext context) => cupertino.CupertinoAlertDialog(
        title: title == null ? null : Text(title!),
        content: message == null ? null : Text(message!),
        actions: actions
            .map(
              (action) => cupertino.CupertinoDialogAction(
                onPressed: action.onPressed,
                isDestructiveAction: action.isCriticalAction,
                child: Text(action.text),
              ),
            )
            .toList(),
      );

  Widget _androidAlertDialog(BuildContext context) => AlertDialog(
        title: title == null ? null : Text(title!),
        content: message == null ? null : Text(message!),
        actions: actions
            .map(
              (action) => TextButton(
                onPressed: action.onPressed,
                style: TextButton.styleFrom(
                  primary: action.isCriticalAction //
                      ? CosmosTheme.of(context).colors.error
                      : null,
                ),
                child: Text(action.text),
              ),
            )
            .toList(),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<OSProvider>.has('osProvider', osProvider))
      ..add(IterableProperty<CosmosModalAction>('actions', actions))
      ..add(StringProperty('title', title))
      ..add(StringProperty('message', message));
  }
}
