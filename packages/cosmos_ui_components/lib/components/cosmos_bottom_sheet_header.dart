import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosBottomSheetHeader extends StatelessWidget {
  const CosmosBottomSheetHeader({
    required this.title,
    required this.titleTextStyle,
    this.leading,
    this.actions,
    this.leadingIcon,
    Key? key,
  }) : super(key: key);

  final String title;
  final TextStyle titleTextStyle;
  final Widget? leading;
  final Widget? leadingIcon;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final isExtended = leading != null || actions != null;
    final theme = CosmosTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isExtended)
          Padding(
            padding: EdgeInsets.only(right: theme.spacingM, top: theme.spacingL),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (leading != null)
                  Row(
                    children: [
                      if (leadingIcon != null)
                        Padding(padding: EdgeInsets.only(left: theme.spacingL), child: leadingIcon),
                      leading!,
                    ],
                  ),
                if (actions != null) ...actions!
              ],
            ),
          ),
        Padding(
          padding: EdgeInsets.only(left: theme.spacingM, top: isExtended ? theme.spacingXL : theme.spacingXXXL),
          child: Row(
            children: [
              SizedBox(width: theme.spacingM),
              Text(title, style: titleTextStyle),
              SizedBox(width: theme.spacingM),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(DiagnosticsProperty<TextStyle>('titleTextStyle', titleTextStyle));
  }
}
