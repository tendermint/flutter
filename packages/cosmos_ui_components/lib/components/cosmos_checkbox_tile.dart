import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosCheckboxTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool checked;

  const CosmosCheckboxTile({
    Key? key,
    required this.text,
    required this.onTap,
    required this.checked,
  }) : super(key: key);

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
                    "assets/images/checkbox_${checked ? "checked" : "unchecked"}.png",
                    package: packageName,
                    width: 24,
                    height: 24,
                  ),
                ),
                Expanded(
                  child: Text(
                    text,
                    style: CosmosTextTheme.copyMinus1Normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
