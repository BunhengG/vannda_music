import 'package:flutter/material.dart';

import '../constant/theme_builder.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = primaryColor,
    this.foregroundColor = Colors.white,
    this.centerTitle = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 20,
        ),
      ),
    );
  }
}
