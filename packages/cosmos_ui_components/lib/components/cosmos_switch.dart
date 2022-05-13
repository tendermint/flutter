import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosSwitch extends StatelessWidget {
  const CosmosSwitch({
    required this.checked,
    required this.toggleAsset,
    required this.checkedGradientStops,
    required this.gradientColors,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final bool checked;
  final ValueChanged<bool>? onChanged;
  final String toggleAsset;
  final List<double> checkedGradientStops;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Alignment>(
      duration: const Duration(milliseconds: 200),
      tween: AlignmentTween(
        begin: checked ? Alignment.centerLeft : Alignment.centerRight,
        end: checked ? Alignment.centerRight : Alignment.centerLeft,
      ),
      builder: (context, value, child) => GestureDetector(
        onTap: () => onChanged!(!checked),
        child: Transform.scale(
          scale: 0.9,
          child: Container(
            width: 50,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: checked
                  ? LinearGradient(
                      stops: checkedGradientStops,
                      colors: gradientColors,
                    )
                  : null,
              color: checked ? null : CosmosTheme.of(context).colors.text,
            ),
            child: Transform.scale(
              scale: 1.1,
              child: Align(
                alignment: value,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(toggleAsset),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('checked', checked))
      ..add(ObjectFlagProperty<ValueChanged<bool>?>.has('onChanged', onChanged))
      ..add(StringProperty('toggleAsset', toggleAsset))
      ..add(IterableProperty<double>('checkedGradientStops', checkedGradientStops))
      ..add(IterableProperty<Color>('gradientColors', gradientColors));
  }
}
