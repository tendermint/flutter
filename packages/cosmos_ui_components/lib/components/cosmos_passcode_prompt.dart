import 'dart:math';

import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class CosmosPasscodePrompt extends StatefulWidget {
  const CosmosPasscodePrompt({
    required this.title,
    this.message,
    this.cancelAction,
    this.cancelText = 'Cancel',
    Key? key,
    this.pinCount = 6,
    this.onChanged,
    this.onSubmit,
  }) : super(key: key);

  final String title;
  final String? message;
  final String cancelText;
  final int pinCount;
  final VoidCallback? cancelAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;

  @override
  State<CosmosPasscodePrompt> createState() => _CosmosPasscodePromptState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(StringProperty('cancelText', cancelText))
      ..add(ObjectFlagProperty<ValueChanged<String>?>.has('onSubmit', onSubmit))
      ..add(StringProperty('message', message))
      ..add(IntProperty('pinCount', pinCount))
      ..add(ObjectFlagProperty<VoidCallback?>.has('cancelAction', cancelAction))
      ..add(ObjectFlagProperty<ValueChanged<String>?>.has('onChanged', onChanged));
  }
}

class _CosmosPasscodePromptState extends State<CosmosPasscodePrompt> {
  late TextEditingController _pinPutController;

  static const filledOpacity = 0.44;
  static const unfilledOpacity = 0.11;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: CosmosTheme.of(context).colors.text.withOpacity(unfilledOpacity),
    );
  }

  @override
  void initState() {
    super.initState();
    _pinPutController = TextEditingController();
  }

  @override
  void dispose() {
    _pinPutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: max(225, MediaQuery.of(context).size.width * 0.7),
        child: Column(
          children: [
            const Spacer(flex: 3),
            if (widget.message != null) ...[
              Text(
                widget.message!,
                textAlign: TextAlign.center,
                style: CosmosTextTheme.copy0Normal,
              ),
              SizedBox(
                height: CosmosTheme.of(context).spacingL,
              )
            ],
            Text(
              widget.title,
              style: CosmosTextTheme.labelL,
            ),
            SizedBox(height: CosmosTheme.of(context).spacingXL),
            PinPut(
              controller: _pinPutController,
              fieldsCount: widget.pinCount,
              fieldsAlignment: MainAxisAlignment.center,
              eachFieldMargin: const EdgeInsets.symmetric(horizontal: 12),
              eachFieldConstraints: const BoxConstraints(
                maxHeight: 10,
                maxWidth: 10,
              ),
              textStyle: const TextStyle(fontSize: 0, color: Colors.transparent),
              eachFieldHeight: 10,
              useNativeKeyboard: false,
              enableInteractiveSelection: false,
              submittedFieldDecoration: _pinPutDecoration.copyWith(
                color: CosmosTheme.of(context).colors.text.withOpacity(filledOpacity),
              ),
              selectedFieldDecoration: _pinPutDecoration,
              followingFieldDecoration: _pinPutDecoration,
            ),
            const Spacer(flex: 2),
            _keyboard(),
            const MinimalBottomSpacer(),
          ],
        ),
      ),
    );
  }

  GridView _keyboard() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map(_digitButton),
        _cancelButton(),
        _digitButton(0),
        _backspaceButton(),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', widget.title));
  }

  Widget _digitButton(int digit) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: CosmosTextTheme.headingM,
      ),
      child: Text(
        '$digit',
      ),
      onPressed: () {
        if (_pinPutController.text.length >= widget.pinCount) {
          return;
        }

        _pinPutController.text = '${_pinPutController.text}$digit';
        _notifyListeners();
      },
    );
  }

  Widget _cancelButton() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: CosmosTextTheme.copy0Normal,
      ),
      onPressed: widget.cancelAction ?? () => Navigator.of(context).pop(),
      child: Text(widget.cancelText),
    );
  }

  Widget _backspaceButton() => TextButton(
        child: const Text('⌫'),
        onPressed: () {
          if (_pinPutController.text.isNotEmpty) {
            _pinPutController.text = _pinPutController.text.substring(0, _pinPutController.text.length - 1);
            _notifyListeners();
          }
        },
      );

  void _notifyListeners() {
    setState(() {});
    widget.onChanged?.call(_pinPutController.text);
    if (widget.pinCount == _pinPutController.text.length) {
      widget.onSubmit?.call(_pinPutController.text);
    }
  }
}
