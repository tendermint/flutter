import 'package:cosmos_ui_components/utils/durations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExpandableContainer extends StatelessWidget {
  const ExpandableContainer({
    required this.expanded,
    required this.child,
    this.initialExpanded = false,
    this.onAnimationEnd,
    this.duration = const LongDuration(),
    Key? key,
  }) : super(key: key);

  final bool expanded;
  final bool initialExpanded;
  final VoidCallback? onAnimationEnd;

  final Duration duration;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      onEnd: onAnimationEnd,
      duration: duration,
      curve: Curves.easeOutQuint,
      tween: Tween<double>(begin: initialExpanded ? 1 : 0.01, end: expanded ? 1 : 0),
      builder: (context, value, child) => value == 0
          //by returning sizedBox here, we make sure the widget and its state
          // is being removed from the tree and disposed correctly
          ? const SizedBox.shrink()
          //=====================
          : ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: value,
                child: child,
              ),
            ),
      child: AnimatedOpacity(
        opacity: expanded ? 1 : 0,
        duration: Duration(milliseconds: (duration.inMilliseconds / 2).round()),
        child: child,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Duration>('duration', duration))
      ..add(DiagnosticsProperty<bool>('expanded', expanded))
      ..add(DiagnosticsProperty<bool>('initialExpanded', initialExpanded))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onAnimationEnd', onAnimationEnd));
  }
}
