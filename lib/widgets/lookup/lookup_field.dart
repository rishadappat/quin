import 'package:flutter/material.dart';
import 'package:quin/utils/question_types.dart';
import 'package:quin/utils/theme.dart';
import 'package:quin/widgets/lookup/lookup_dialog.dart';

class LookupField extends StatefulWidget {
  const LookupField(
      {super.key,
      required this.placeholder,
      required this.onSelected,
      required this.controller});

  final String placeholder;

  final Function(QuestionTypes) onSelected;

  final TextEditingController controller;

  @override
  State<LookupField> createState() => _LookupFieldState();
}

class _LookupFieldState extends State<LookupField> {
  @override
  Widget build(BuildContext context) {
    if (widget.controller.text.isEmpty) {
      widget.controller.text = widget.placeholder;
    }
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          showModalBottomSheet(
              elevation: 10,
              showDragHandle: false,
              isScrollControlled: true,
              isDismissible: true,
              enableDrag: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              context: context,
              builder: (context) => LookupDialog(
                    lookupName: widget.placeholder,
                    onSelected: (p0) {
                      setState(() {
                        widget.controller.text = p0.value;
                      });
                      widget.onSelected(p0);
                    },
                  ));
        },
        child: Ink(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: colorScheme.secondaryContainer,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: colorScheme.primary,
                    size: 40,
                  ),
                ),
                enabled: false,
                controller: widget.controller,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: widget.controller.text == widget.placeholder
                        ? colorScheme.secondary
                        : colorScheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
