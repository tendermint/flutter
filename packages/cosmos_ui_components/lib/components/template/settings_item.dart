import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    required this.text,
    required this.textStyle,
    this.infoIcon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextStyle textStyle;
  final Widget? infoIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL, vertical: theme.spacingM),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Text(text, style: textStyle),
            const Spacer(),
            if (infoIcon != null) infoIcon!,
            Image.asset('assets/images/arrow_right.png', package: packageName),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<TextStyle>('textStyle', textStyle))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
