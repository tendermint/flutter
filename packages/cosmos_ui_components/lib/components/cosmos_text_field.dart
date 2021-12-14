import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosTextField extends StatefulWidget {
  const CosmosTextField({
    required this.onChanged,
    this.maxLength,
    this.initialText = '',
    this.maxLines,
    this.minLines,
    this.suffix,
    this.hint,
    this.keyboardType,
    this.controller,
    Key? key,
  }) : super(key: key);

  final String initialText;
  final Function(String) onChanged;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? hint;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  State<CosmosTextField> createState() => _CosmosTextFieldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('maxLines', maxLines))
      ..add(IntProperty('maxLength', maxLength))
      ..add(DiagnosticsProperty<TextInputType?>('keyboardType', keyboardType))
      ..add(StringProperty('initialText', initialText))
      ..add(IntProperty('minLines', minLines))
      ..add(ObjectFlagProperty<Function(String p1)>.has('onChanged', onChanged))
      ..add(DiagnosticsProperty<TextEditingController?>('controller', controller))
      ..add(StringProperty('hint', hint));
  }
}

class _CosmosTextFieldState extends State<CosmosTextField> {
  late TextEditingController controller;
  bool isTextEmpty = false;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    controller.text = widget.initialText;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      // it's a controller created internally by the CosmosTextField, thus we'll take care of disposing it properly here
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return TextField(
      controller: controller,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        widget.onChanged(value);
        if (value.isEmpty == isTextEmpty) {
          setState(() {});
          isTextEmpty = !isTextEmpty;
        }
      },
      decoration: InputDecoration(
        counterText: widget.maxLength == null ? null : '',
        border: UnderlineInputBorder(borderSide: BorderSide(color: theme.colors.inputBorder)),
        hintText: widget.hint,
        hintStyle: CosmosTextTheme.copy0Normal.copyWith(
          color: theme.colors.text.withOpacity(0.67),
        ),
        suffix: widget.suffix == null
            ? _buildClearButton()
            : (controller.text.isEmpty ? widget.suffix : _buildClearButton()),
      ),
    );
  }

  InkWell _buildClearButton() {
    return InkWell(
      onTap: () {
        controller.clear();
        setState(() {});
      },
      child: SizedBox(
        height: 17,
        width: 17,
        child: Image.asset('assets/images/cross.png', package: packageName),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<TextEditingController>('controller', controller))
      ..add(DiagnosticsProperty<bool>('isTextEmpty', isTextEmpty));
  }
}
