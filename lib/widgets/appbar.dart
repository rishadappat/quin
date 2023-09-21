import 'package:flutter/material.dart';
import 'package:quin/utils/theme.dart';

class QuinAppbar extends StatefulWidget implements PreferredSizeWidget {
  const QuinAppbar({super.key, required this.title, required this.fontSize});

  final String title;

  final double fontSize;

  @override
  State<QuinAppbar> createState() => _QuinAppbarState();

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}

class _QuinAppbarState extends State<QuinAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: colorScheme.onBackground, //change your color here
      ),
      title: Text(
        widget.title,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: colorScheme.onBackground,
            fontSize: widget.fontSize),
      ),
      titleSpacing: 20.0,
      centerTitle: false,
      toolbarHeight: kToolbarHeight,
      toolbarOpacity: 0.8,
      elevation: 0.00,
      backgroundColor: colorScheme.background,
    );
  }
}
