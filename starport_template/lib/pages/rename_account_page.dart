import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenameAccountPage extends StatelessWidget {
  const RenameAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Scaffold(
      appBar: const CosmosAppBar(
        leading: CosmosBackButton(text: 'Back'),
        title: 'Name your account',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacingL, vertical: theme.spacingM),
              child: CosmosTextField(
                onChanged: (value) {},
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
              child: Row(
                children: [
                  Expanded(
                    child: CosmosElevatedButton(
                      text: 'Save',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: theme.spacingL),
            SizedBox(height: theme.spacingM),
          ],
        ),
      ),
    );
  }
}

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
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.text;
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
        border: const UnderlineInputBorder(),
        counterText: '',
        suffix: SizedBox(
          height: 17,
          width: 17,
          child: CircleAvatar(
            backgroundColor: theme.colors.clearButtonBg,
            foregroundColor: theme.colors.background,
            child: InkWell(
              onTap: () {
                controller.clear();
                widget.onChanged('');
              },
              child: const Icon(Icons.clear, size: 12),
            ),
          ),
        ),
      ),
    );
  }
}
