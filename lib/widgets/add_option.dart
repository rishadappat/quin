import 'package:flutter/material.dart';
import 'package:quin/utils/theme.dart';
import 'package:quin/widgets/form_textfield.dart';

class AddOption extends StatefulWidget {
  const AddOption({super.key, required this.onTapAdd});

  final Function(String) onTapAdd;

  @override
  State<AddOption> createState() => _AddOptionState();
}

class _AddOptionState extends State<AddOption> {
  String optionValue = '';
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FormTextField(
            placeHolder: 'Option',
            isMultiline: false,
            onChanged: (p0) {
              optionValue = p0;
            },
            controller: controller,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            widget.onTapAdd(optionValue);
            setState(() {
              optionValue = '';
              controller.text = '';
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              fixedSize: const Size(80, 50),
              padding: const EdgeInsets.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text(
            'Add',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
