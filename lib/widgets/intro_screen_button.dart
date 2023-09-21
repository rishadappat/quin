import 'package:flutter/material.dart';
import 'package:quin/utils/theme.dart';

class IntroScreenButton extends StatefulWidget {
  const IntroScreenButton(
      {super.key,
      required this.buttonTitle,
      required this.icon,
      required this.onTap});

  final String buttonTitle;
  final IconData icon;
  final Function()? onTap;

  @override
  State<IntroScreenButton> createState() => _IntroScreenButtonState();
}

class _IntroScreenButtonState extends State<IntroScreenButton> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shadowColor: colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        color: colorScheme.primary,
        child: InkWell(
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.icon,
                  size: 40,
                  color: colorScheme.surface,
                ),
                const Spacer(),
                Text(
                  widget.buttonTitle,
                  style: TextStyle(
                      color: colorScheme.surface,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
