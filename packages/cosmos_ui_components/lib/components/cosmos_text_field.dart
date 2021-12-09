import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosTextField extends StatefulWidget {
  final String initialText;
  final Function(String) onChanged;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? hint;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const CosmosTextField({
    Key? key,
    required this.onChanged,
    this.maxLength,
    this.initialText = '',
    this.maxLines,
    this.minLines,
    this.suffix,
    this.hint,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  State<CosmosTextField> createState() => _CosmosTextFieldState();
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
        suffix: widget.suffix == null ? _buildClearButton() : (controller.text.isEmpty ? null : _buildClearButton()),
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
}
