import 'package:flutter/material.dart';
import 'package:quin/utils/theme.dart';

class QuinButton extends StatefulWidget {
  const QuinButton({super.key, required this.title, this.onTap});

  final String title;
  final Function()? onTap;

  @override
  State<QuinButton> createState() => _QuinButtonState();
}

class _QuinButtonState extends State<QuinButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: colorScheme.primary,
        backgroundColor: colorScheme.primary,
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: const Size(100, 50), //////// HERE
      ),
      onPressed: widget.onTap,
      child: Text(
        widget.title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
