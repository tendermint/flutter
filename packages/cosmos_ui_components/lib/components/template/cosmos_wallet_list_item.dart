import 'package:cosmos_ui_components/components/cosmos_wallet_edit_button.dart';
import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosWalletListItem extends StatelessWidget {
  final String name;
  final String address;
  final bool isSelected;
  final bool isEditing;
  final VoidCallback onClicked;
  final Function(String) onEditIconPressed;

  const CosmosWalletListItem({
    Key? key,
    required this.name,
    required this.address,
    required this.isSelected,
    required this.onClicked,
    required this.isEditing,
    required this.onEditIconPressed,
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
                      Text(name, style: CosmosTextTheme.labelM),
                    ],
                  ),
                  if (isEditing)
                    CosmosWalletEditButton(onPressed: () => onEditIconPressed(address))
                  else if (isSelected)
                    const Icon(Icons.check_circle_outline),
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
