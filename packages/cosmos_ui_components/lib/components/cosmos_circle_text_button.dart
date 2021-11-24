import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosCircleTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;

  const CosmosCircleTextButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            // TODO: There needs to be a radius that matches the size in the design provided in Figma
            maxRadius: 12,
            minRadius: 12,
            // TODO: Pick up these colors from `CosmosTheme.of(context).colors`
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            child: Icon(icon, size: CosmosTheme.of(context).fontSizeM),
          ),
          SizedBox(width: CosmosTheme.of(context).spacingL),
          Text(text),
        ],
      ),
    );
  }
}
