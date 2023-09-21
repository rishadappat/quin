import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quin/utils/theme.dart';
import 'package:quin/widgets/buttons.dart';

class SuccessDialog extends StatefulWidget {
  const SuccessDialog({super.key, required this.onClosed});

  final Function() onClosed;

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Container(
              color: colorScheme.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.verified,
                    size: 100,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Success',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Question added successfully.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: QuinButton(
                      title: 'Add Another Question',
                      onTap: () {
                        context.pop();
                        widget.onClosed();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
