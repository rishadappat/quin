import 'package:flutter/material.dart';
import 'package:quin/utils/theme.dart';

class OptionItem extends StatefulWidget {
  const OptionItem(
      {super.key,
      required this.index,
      required this.optionValue,
      required this.animation,
      required this.onTapRemove});

  final int index;
  final String optionValue;
  final Animation<double> animation;
  final Function() onTapRemove;

  @override
  State<OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axis: Axis.vertical,
        sizeFactor: widget.animation,
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: colorScheme.primary, width: 3),
                          shape: BoxShape.circle),
                      child: Center(
                          child: Text(
                        '${(widget.index + 1)}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.optionValue,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: colorScheme.error,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.close_rounded,
                            color: colorScheme.onError),
                        onPressed: widget.onTapRemove,
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
