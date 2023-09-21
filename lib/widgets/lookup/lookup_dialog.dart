import 'package:flutter/material.dart';
import 'package:quin/utils/question_types.dart';
import 'package:quin/utils/theme.dart';
import 'package:quin/utils/utility.dart';

class LookupDialog extends StatefulWidget {
  const LookupDialog({super.key, required this.lookupName, this.onSelected});

  final String lookupName;

  final Function(QuestionTypes)? onSelected;

  @override
  State<LookupDialog> createState() => _LookupDialogState();
}

class _LookupDialogState extends State<LookupDialog> {
  @override
  Widget build(BuildContext context) {
    List<QuestionTypes> lookupValues = QuestionTypes.values;
    int itemCount = lookupValues.length;
    double headerHeight = 140;
    double itemsHeight = itemCount * 70;
    double maxHeight = (headerHeight + itemsHeight) / getDeviceHeight(context);
    return DraggableScrollableSheet(
        initialChildSize: maxHeight,
        minChildSize: 0.2,
        maxChildSize: maxHeight > 0.9 ? 0.9 : maxHeight,
        expand: false,
        builder: (_, controller) => Column(
              children: [
                const Icon(
                  Icons.horizontal_rule,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    widget.lookupName,
                    style: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    itemCount: itemCount,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: SizedBox(
                          height: 60,
                          child: Card(
                            child: InkWell(
                              onTap: () {
                                widget.onSelected!(lookupValues[index]);
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(lookupValues[index].value),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ));
  }
}
