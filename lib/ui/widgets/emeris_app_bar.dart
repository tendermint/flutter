import 'package:flutter/material.dart';

class EmerisAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const EmerisAppBar({
    Key? key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
