import 'package:cosmos_ui_components/cosmos_app_theme.dart';
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
    const lightInactive = CosmosColors.lightInactive;
    const lightDivider = CosmosColors.lightDivider;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(CosmosAppTheme.radiusS)),
          border: Border.all(
            color: lightInactive.withOpacity(word.isEmpty ? lightInactive.opacity / 2 : lightInactive.opacity),
          ),
          color: lightDivider.withOpacity(word.isEmpty ? lightDivider.opacity / 2 : lightDivider.opacity),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CosmosAppTheme.spacingS,
            vertical: CosmosAppTheme.spacingXS,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showIndex) ...[
                Text(
                  "$index",
                  style: textTheme.bodyText1,
                ),
                const SizedBox(width: CosmosAppTheme.spacingS),
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
