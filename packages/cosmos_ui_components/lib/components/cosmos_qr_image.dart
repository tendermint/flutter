import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CosmosQrImage extends StatelessWidget {
  const CosmosQrImage({
    required this.data,
    this.borderRadius,
    this.padding = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  final String data;
  final BorderRadius? borderRadius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(theme.radiusL),
      child: QrImage(
        padding: padding,
        data: data,
        foregroundColor: theme.colors.text,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('data', data))
      ..add(DiagnosticsProperty<BorderRadius?>('radius', borderRadius))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding));
  }
}
