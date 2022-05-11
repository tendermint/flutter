import 'dart:async';

import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyToClipboardButton extends StatefulWidget {
  const CopyToClipboardButton({
    required this.copyData,
    this.copyText = 'Copy to clipboard',
    this.copiedText = 'Copied to clipboard',
    this.confirmationDuration = const Duration(seconds: 5),
    Key? key,
  }) : super(key: key);

  final String copyText;
  final String copiedText;
  final String copyData;
  final Duration confirmationDuration;

  @override
  State<CopyToClipboardButton> createState() => _CopyToClipboardButtonState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('copiedText', copiedText))
      ..add(StringProperty('copyData', copyData))
      ..add(StringProperty('copyText', copyText))
      ..add(DiagnosticsProperty<Duration>('confirmationDuration', confirmationDuration));
  }
}

class _CopyToClipboardButtonState extends State<CopyToClipboardButton> {
  var _copied = false;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    final colors = CosmosTheme.of(context).colors;
    return AnimatedSwitcher(
      duration: const ShortDuration(),
      child: _copyButton(colors),
    );
  }

  Widget _copyButton(CosmosColorsData colors) {
    final _color = _copied ? colors.positiveText : colors.link;
    return CosmosTextButton(
      key: ValueKey('$CopyToClipboardButton: $_copied'),
      text: _copied ? 'Copied to clipboard' : 'Copy to clipboard',
      color: _color,
      leadingIcon: Image.asset(
        _copied ? 'assets/images/icon_check_16.png' : 'assets/images/icon_copy_16.png',
        width: 16,
        height: 16,
        color: _color,
      ),
      onTap: _onTapCopy,
    );
  }

  void _onTapCopy() {
    Clipboard.setData(
      ClipboardData(text: widget.copyData),
    );
    setState(() => _copied = true);
    _timer = Timer(
      widget.confirmationDuration,
      () => mounted ? setState(() => _copied = false) : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
      _timer = null;
    }
  }
}
