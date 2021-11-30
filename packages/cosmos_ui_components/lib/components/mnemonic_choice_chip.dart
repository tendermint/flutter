import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class MnemonicChoiceChip extends StatelessWidget {
  final int index;
  final String word;
  final bool showIndex;
  final VoidCallback? onTap;
  final MnemonicChoiceChipStyle? style;

  const MnemonicChoiceChip({
    Key? key,
    required this.index,
    required this.word,
    this.showIndex = true,
    this.onTap,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = MnemonicChoiceChipStyle.def(context).mergeWith(style);
    final radius = Radius.circular(effectiveStyle.borderRadius ?? 0);
    final borderRadius = BorderRadius.all(radius);
    return Material(
      color: effectiveStyle.backgroundColor,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: effectiveStyle.textColor?.withOpacity(0.3),
        onTap: onTap,
        child: DottedBorder(
          dashPattern: (effectiveStyle.dottedBorder ?? false) ? [2, 4] : [1, 0],
          color: effectiveStyle.borderColor ?? Colors.transparent,
          strokeWidth: effectiveStyle.borderWidth ?? 0.0,
          radius: radius,
          borderType: BorderType.RRect,
          child: Padding(
            padding: EdgeInsets.only(
              left: showIndex ? CosmosTheme.of(context).spacingM : CosmosTheme.of(context).spacingL,
              right: CosmosTheme.of(context).spacingL,
              top: CosmosTheme.of(context).spacingM,
              bottom: CosmosTheme.of(context).spacingM,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showIndex) ...[
                  _indexText(context, effectiveStyle, index),
                ],
                Text(
                  word,
                  style: CosmosTextTheme.labelS.copyWith(
                    color: effectiveStyle.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _indexText(BuildContext context, MnemonicChoiceChipStyle style, int index) => Padding(
        padding: EdgeInsets.only(right: CosmosTheme.of(context).spacingM),
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: style.indexBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "${index + 1}",
              style: CosmosTextTheme.smallCaption.copyWith(
                color: style.indexTextColor,
              ),
            ),
          ),
        ),
      );
}

class MnemonicChoiceChipStyle {
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final bool? dottedBorder;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? indexBackgroundColor;
  final Color? indexTextColor;

  MnemonicChoiceChipStyle({
    this.borderColor,
    this.borderWidth,
    this.dottedBorder,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.indexBackgroundColor,
    this.indexTextColor,
  });

  factory MnemonicChoiceChipStyle.def(BuildContext context) {
    return MnemonicChoiceChipStyle(
      borderColor: Colors.transparent,
      borderWidth: 0,
      dottedBorder: false,
      backgroundColor: CosmosTheme.of(context).colors.chipBackground,
      textColor: CosmosTheme.of(context).colors.text,
      indexBackgroundColor: CosmosTheme.of(context).colors.text,
      indexTextColor: CosmosTheme.of(context).colors.chipBackground,
      borderRadius: CosmosTheme.of(context).radiusM,
    );
  }

  MnemonicChoiceChipStyle mergeWith(MnemonicChoiceChipStyle? other) {
    if (other == null) {
      return this;
    }
    return MnemonicChoiceChipStyle(
      borderColor: other.borderColor ?? borderColor,
      borderWidth: other.borderWidth ?? borderWidth,
      dottedBorder: other.dottedBorder ?? dottedBorder,
      borderRadius: other.borderRadius ?? borderRadius,
      backgroundColor: other.backgroundColor ?? backgroundColor,
      textColor: other.textColor ?? textColor,
      indexBackgroundColor: other.indexBackgroundColor ?? indexBackgroundColor,
      indexTextColor: other.indexTextColor ?? indexTextColor,
    );
  }
}
