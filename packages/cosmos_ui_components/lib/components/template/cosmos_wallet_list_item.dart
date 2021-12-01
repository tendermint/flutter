import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosWalletListItem extends StatelessWidget {
  final String name;
  final String address;
  final bool isSelected;
  final VoidCallback onClicked;
  final Widget? suffix;

  const CosmosWalletListItem({
    Key? key,
    required this.name,
    required this.address,
    required this.isSelected,
    required this.onClicked,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return InkWell(
      onTap: onClicked,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(theme.spacingL),
            margin: EdgeInsets.symmetric(
              horizontal: theme.spacingL,
              vertical: theme.spacingM,
            ),
            decoration: BoxDecoration(
              borderRadius: theme.borderRadiusM,
              // TODO: This color needs to be fixed. Doesn't match the dark theme.
              border: Border.all(color: isSelected ? Colors.black12 : Colors.transparent),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: theme.spacingM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(height: 32, child: GradientAvatar(stringKey: address)),
                      SizedBox(width: theme.spacingM),
                      Text(name, style: CosmosTextTheme.title0Medium),
                    ],
                  ),
                  if (suffix != null) suffix!,
                ],
              ),
            ),
          ),
          SizedBox(height: theme.spacingL),
        ],
      ),
    );
  }
}
