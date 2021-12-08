import 'package:clipboard/clipboard.dart';
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
  final bool isClipBoardType;
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
    this.isClipBoardType = false,
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

  void setText(String text) {
    controller.text = text;
    setState(() {});
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
        suffixIcon: controller.text.isEmpty ? widget.suffix : null,
        suffix: widget.suffix == null
            ? (widget.isClipBoardType
                ? (controller.text.isEmpty ? _buildPasteButton() : _buildClearButton())
                : _buildClearButton())
            : (controller.text.isEmpty ? null : _buildClearButton()),
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

  Widget _buildPasteButton() => CosmosTextButton(
        onTap: () => FlutterClipboard.paste().then((value) => setState(() => controller.text = value)),
        text: 'Paste',
        color: CosmosTheme.of(context).colors.link,
      );
}
