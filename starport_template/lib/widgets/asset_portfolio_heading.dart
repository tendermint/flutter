import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class AssetPortfolioHeading extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AssetPortfolioHeading({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: CosmosTheme.of(context).spacingL, top: CosmosTheme.of(context).spacingM),
      child: Row(
        children: [
          Text(title, style: TextStyle(fontSize: CosmosTheme.of(context).fontSizeXL, fontWeight: FontWeight.w700)),
          IconButton(icon: Icon(Icons.arrow_downward_sharp, size: CosmosTheme.of(context).fontSizeXL), onPressed: onTap)
        ],
      ),
    );
  }
}
