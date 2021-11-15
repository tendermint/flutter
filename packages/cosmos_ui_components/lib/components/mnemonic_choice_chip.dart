import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class MnemonicChoiceChip extends StatelessWidget {
  final int index;
  final String word;
  final bool showIndex;
  final VoidCallback? onTap;

  const MnemonicChoiceChip({
    Key? key,
    required this.index,
    required this.word,
    this.showIndex = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const lightInactive = CosmosColorsData.lightInactive;
    const lightDivider = CosmosColorsData.lightDivider;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(CosmosTheme.of(context).radiusS)),
          border: Border.all(
            color: lightInactive.withOpacity(word.isEmpty ? lightInactive.opacity / 2 : lightInactive.opacity),
          ),
          color: lightDivider.withOpacity(word.isEmpty ? lightDivider.opacity / 2 : lightDivider.opacity),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CosmosTheme.of(context).spacingS,
            vertical: CosmosTheme.of(context).spacingXS,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showIndex) ...[
                Text(
                  "$index",
                  style: textTheme.bodyText1,
                ),
                SizedBox(width: CosmosTheme.of(context).spacingS),
              ],
              Text(
                word,
                style: textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
