import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CosmosAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.preferredHeight,
  }) : super(key: key);

  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final double? preferredHeight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: CosmosTheme.of(context).spacingS),
              if (leading != null) leading!,
              const Spacer(),
              if (actions != null) ...actions!,
            ],
          ),
          if (title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: CosmosTheme.of(context).spacingL),
              child: Text(title!, style: CosmosTextTheme.titleSans2Bold),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight ?? (title == null ? kToolbarHeight : 120));

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(DoubleProperty('preferredHeight', preferredHeight));
  }
}
