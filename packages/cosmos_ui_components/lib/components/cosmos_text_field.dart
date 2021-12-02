import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosTextField extends StatefulWidget {
  final String text;
  final String hint;
  final Function(String) onChanged;
  final int? maxLines;
  final int maxLength;
  final Widget? suffix;
  final TextInputType? keyboardType;

  const CosmosTextField({
    Key? key,
    required this.onChanged,
    this.maxLength = 50,
    this.text = '',
    this.maxLines,
    this.suffix,
    this.hint = '',
    this.keyboardType,
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
    controller = TextEditingController();
    controller.text = widget.text;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return TextField(
      controller: controller,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        widget.onChanged(value);
        if (value.isEmpty == isTextEmpty) {
          setState(() {});
          isTextEmpty = !isTextEmpty;
        }
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(borderSide: BorderSide(color: theme.colors.inputBorder)),
        hintText: widget.hint,
        hintStyle: CosmosTextTheme.copy0Normal,
        counterText: '',
        suffixIcon: controller.text.isNotEmpty ? null : widget.suffix,
        suffix: widget.suffix != null ? (controller.text.isNotEmpty ? _buildClearButton() : null) : _buildClearButton(),
      ),
    );
  }

  InkWell _buildClearButton() {
    return InkWell(
      onTap: () {
        controller.clear();
        widget.onChanged('');
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
