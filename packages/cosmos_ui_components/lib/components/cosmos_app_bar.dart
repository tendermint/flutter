import 'package:flutter/material.dart';

class CosmosAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CosmosAppBar({
    Key? key,
    this.title = "",
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
