import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosBottomSheetHeader extends StatelessWidget {
  final String title;
  final TextStyle titleTextStyle;
  final Widget? leading;
  final Widget? leadingIcon;
  final List<Widget>? actions;

  const CosmosBottomSheetHeader({
    Key? key,
    required this.title,
    required this.titleTextStyle,
    this.leading,
    this.actions,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null || actions != null)
          Padding(
            padding: EdgeInsets.only(right: theme.spacingM),
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
        SizedBox(height: theme.spacingM),
        Padding(
          padding: EdgeInsets.only(left: theme.spacingM),
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
}
