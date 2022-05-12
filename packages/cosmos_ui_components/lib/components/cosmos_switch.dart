import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/utils/global_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosSwitch extends StatefulWidget {
  const CosmosSwitch({
    required this.checked,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final bool checked;
  final ValueChanged<bool>? onChanged;

  @override
  CosmosSwitchState createState() => CosmosSwitchState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<ValueChanged<bool>?>.has('onChanged', onChanged))
      ..add(DiagnosticsProperty<bool>('checked', checked));
  }
}

class CosmosSwitchState extends State<CosmosSwitch> with SingleTickerProviderStateMixin {
  late Animation<Alignment> _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _circleAnimation = AlignmentTween(
      begin: widget.checked ? Alignment.centerRight : Alignment.centerLeft,
      end: widget.checked ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
        widget.onChanged!(!widget.checked);
      },
      child: _AnimatedSwitch(animation: _circleAnimation, checked: widget.checked),
    );
  }
}

class _AnimatedSwitch extends AnimatedWidget {
  const _AnimatedSwitch({
    required Animation<Alignment> animation,
    required this.checked,
    Key? key,
  }) : super(key: key, listenable: animation);

  final bool checked;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Alignment>;
    return Transform.scale(
      scale: 0.9,
      child: Container(
        width: 50,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: checked
              ? const LinearGradient(
                  stops: [0, 0.5866, 1],
                  colors: GlobalConstants.cosmosGradientColors,
                )
              : null,
          color: checked ? null : CosmosTheme.of(context).colors.text,
        ),
        child: Transform.scale(
          scale: 1.1,
          child: Align(
            alignment: animation.value,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset('assets/images/toggle.png'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('checked', checked));
  }
}
