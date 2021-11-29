import 'package:cosmos_ui_components/cosmos_text_theme.dart';
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
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(CosmosTheme.of(context).radiusM)),
          color: CosmosTheme.of(context).colors.chipBackground,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: CosmosTheme.of(context).spacingM,
            right: CosmosTheme.of(context).spacingL,
            top: CosmosTheme.of(context).spacingM,
            bottom: CosmosTheme.of(context).spacingM,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showIndex) ...[
                _indexText(context, index),
              ],
              Text(
                word,
                style: CosmosTextTheme.labelS,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _indexText(BuildContext context, int index) => Padding(
        padding: EdgeInsets.only(right: CosmosTheme.of(context).spacingM),
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: CosmosTheme.of(context).colors.text,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "${index + 1}",
              style: CosmosTextTheme.smallCaption.copyWith(
                color: CosmosTheme.of(context).colors.chipBackground,
              ),
            ),
          ),
        ),
      );
}
