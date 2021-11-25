import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosWalletListItem extends StatelessWidget {
  final String name;
  final String address;
  final bool isSelected;
  final VoidCallback onClicked;

  const CosmosWalletListItem({
    Key? key,
    required this.name,
    required this.address,
    required this.isSelected,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
        margin: EdgeInsets.symmetric(
          horizontal: CosmosTheme.of(context).spacingL,
          vertical: CosmosTheme.of(context).spacingM,
        ),
        decoration: BoxDecoration(
          borderRadius: CosmosTheme.of(context).borderRadiusM,
          // TODO: This color needs to be fixed. Doesn't match the dark theme.
          border: Border.all(color: isSelected ? Colors.black12 : Colors.transparent),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: CosmosTheme.of(context).spacingM),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(height: 35, child: GradientAvatar(stringKey: address)),
                  SizedBox(width: CosmosTheme.of(context).spacingM),
                  // TODO: Add text styles from `CosmosTheme.of(context)`
                  Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              if (isSelected) Icon(Icons.check_circle_outline, size: CosmosTheme.of(context).fontSizeXL),
            ],
          ),
        ),
      ),
    );
  }
}
