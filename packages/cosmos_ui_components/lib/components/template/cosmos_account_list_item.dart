import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosAccountListItem extends StatelessWidget {
  const CosmosAccountListItem({
    required this.name,
    required this.address,
    required this.isSelected,
    required this.onClicked,
    this.suffix,
    Key? key,
  }) : super(key: key);

  final String name;
  final String address;
  final bool isSelected;
  final VoidCallback onClicked;
  final Widget? suffix;

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
              border: Border.all(
                  color:
                      isSelected ? theme.colors.divider : Colors.transparent),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: theme.spacingM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 32,
                          child: GradientAvatar(stringKey: address)),
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('name', name))
      ..add(DiagnosticsProperty<bool>('isSelected', isSelected))
      ..add(ObjectFlagProperty<VoidCallback>.has('onClicked', onClicked))
      ..add(StringProperty('address', address));
  }
}
