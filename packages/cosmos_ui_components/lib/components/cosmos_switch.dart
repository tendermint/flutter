import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosSwitch extends StatelessWidget {
  const CosmosSwitch({
    required this.checked,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final bool checked;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Transform.scale(
      scale: 0.9, // so that the border appears closer to the switch
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(
            color: checked ? Colors.transparent : theme.colors.text.withOpacity(0.1),
          ),
        ),
        child: Transform.scale(
          scale: 1.1, // so that the border appears closer to the switch
          child: CupertinoSwitch(
            value: checked,
            onChanged: onChanged,
            activeColor: theme.colors.link,
            thumbColor: checked ? theme.colors.background : theme.colors.text,
            trackColor: theme.colors.background,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<ValueChanged<bool>?>.has('onChanged', onChanged))
      ..add(DiagnosticsProperty<bool>('checked', checked));
  }
}
