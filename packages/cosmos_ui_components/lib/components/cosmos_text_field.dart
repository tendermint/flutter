import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosTextField extends StatefulWidget {
  final String text;
  final Function(String) onChanged;
  final int? maxLines;
  final int maxLength;

  const CosmosTextField({
    Key? key,
    required this.onChanged,
    this.maxLength = 50,
    this.text = '',
    this.maxLines,
  }) : super(key: key);

  @override
  State<CosmosTextField> createState() => _CosmosTextFieldState();
}

class _CosmosTextFieldState extends State<CosmosTextField> {
  late TextEditingController controller;

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
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: UnderlineInputBorder(borderSide: BorderSide(color: theme.colors.inputBorder)),
        counterText: '',
        suffix: InkWell(
          onTap: () {
            controller.clear();
            widget.onChanged('');
          },
          child: SizedBox(height: 17, width: 17, child: Image.asset('assets/images/cross.png')),
        ),
      ),
    );
  }
}
