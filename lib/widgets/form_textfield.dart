import 'package:flutter/material.dart';
import 'package:quin/utils/theme.dart';

class FormTextField extends StatefulWidget {
  const FormTextField(
      {super.key,
      required this.placeHolder,
      required this.isMultiline,
      required this.onChanged,
      required this.controller});

  final String placeHolder;

  final bool isMultiline;

  final Function(String) onChanged;

  final TextEditingController controller;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      textAlignVertical: TextAlignVertical.top,
      minLines: widget.isMultiline ? 4 : 1,
      maxLines: null,
      textCapitalization: TextCapitalization.sentences,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: widget.controller,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: colorScheme.secondary),
        labelText: widget.placeHolder,
        hintText: widget.placeHolder,
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: colorScheme.secondaryContainer),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: colorScheme.secondaryContainer),
            borderRadius: BorderRadius.circular(10)),
        focusColor: colorScheme.primary,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: colorScheme.primary),
            borderRadius: BorderRadius.circular(10)),
        fillColor: Colors.white,
        filled: true,
        alignLabelWithHint: true,
      ),
    );
  }
}
