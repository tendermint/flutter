import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosImageButton extends StatelessWidget {
  final String assetUrl;
  final VoidCallback onPressed;

  const CosmosImageButton({
    Key? key,
    required this.assetUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: SizedBox(
        height: 24,
        width: 24,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CosmosTheme.of(context).colors.text, width: 2),
          ),
          child: Image.asset(assetUrl),
        ),
      ),
    );
  }
}
