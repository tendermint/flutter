import 'dart:math';

import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// adds vertical space equal to [padding]. on devices with system bottom padding (i.e: iphones without home button),
/// it makes sure the total padding (system + [padding]) is no larger than [padding].
class MinimalBottomSpacer extends StatelessWidget {
  const MinimalBottomSpacer({
    Key? key,
    this.padding,
  }) : super(key: key);

  final double? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: minimalBottomPadding(
        context,
        padding ?? CosmosTheme.of(context).spacingL,
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('padding', padding));
  }
}

double minimalBottomPadding(BuildContext context, double padding) {
  final bottom = MediaQuery.of(context).padding.bottom;
  return max(0, padding - bottom);
}
