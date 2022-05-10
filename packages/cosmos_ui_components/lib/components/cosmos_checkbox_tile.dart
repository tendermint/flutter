import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosCheckboxTile extends StatelessWidget {
  const CosmosCheckboxTile({
    required this.text,
    required this.onTap,
    required this.checked,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    final radius = theme.borderRadiusM;
    return Material(
      borderRadius: radius,
      color: Colors.transparent,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: theme.colors.divider,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(theme.spacingL),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: theme.spacingS,
                    right: theme.spacingL,
                  ),
                  child: Image.asset(
                    'assets/images/checkbox${checked ? "" : "_unchecked"}.png',
                    package: packageName,
                    color: checked ? theme.colors.text : theme.colors.inactive,
                    width: 24,
                    height: 24,
                  ),
                ),
                Expanded(
                  child: Text(
                    text,
                    style: CosmosTextTheme.copyMinus1Normal.copyWith(color: theme.colors.text),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap))
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<bool>('checked', checked));
  }
}
