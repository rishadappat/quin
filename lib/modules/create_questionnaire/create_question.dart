import 'package:flutter/material.dart';
import 'package:quin/utils/question_types.dart';
import 'package:quin/widgets/add_option.dart';
import 'package:quin/widgets/appbar.dart';
import 'package:quin/widgets/buttons.dart';
import 'package:quin/widgets/dialogs/success_dialog.dart';
import 'package:quin/widgets/form_textfield.dart';
import 'package:quin/widgets/lookup/lookup_field.dart';
import 'package:quin/widgets/option_item.dart';

class CreateQuestion extends StatefulWidget {
  const CreateQuestion({super.key});

  @override
  State<CreateQuestion> createState() => _CreateQuestionState();
}

class _CreateQuestionState extends State<CreateQuestion> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  final List<String> _items = [];

  final TextEditingController controller = TextEditingController();

  QuestionTypes? selectedQuestionType;

  final TextEditingController lookupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool showOptions = selectedQuestionType == QuestionTypes.multipleChoice ||
        selectedQuestionType == QuestionTypes.singleChoice;

    return Scaffold(
        appBar: const QuinAppbar(title: 'Create Question', fontSize: 20),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                FormTextField(
                  onChanged: (p0) {},
                  placeHolder: 'Question',
                  isMultiline: true,
                  controller: controller,
                ),
                const SizedBox(
                  height: 30,
                ),
                LookupField(
                  controller: lookupController,
                  placeholder: 'Question Category',
                  onSelected: (selectedItem) {
                    setState(() {
                      selectedQuestionType = selectedItem;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Visibility(
                    visible: showOptions,
                    child: Column(
                      children: [
                        AddOption(
                          onTapAdd: (p0) {
                            if (p0.isNotEmpty) {
                              listKey.currentState?.insertItem(_items.length);
                              _items.add(p0);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimatedList(
                          key: listKey,
                          initialItemCount: _items.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index, animation) {
                            String item = _items[index];
                            return OptionItem(
                              index: index,
                              optionValue: item,
                              animation: animation,
                              onTapRemove: () {
                                listKey.currentState?.removeItem(
                                    index,
                                    (_, animation) => OptionItem(
                                          index: index,
                                          optionValue: item,
                                          animation: animation,
                                          onTapRemove: () {},
                                        ),
                                    duration:
                                        const Duration(milliseconds: 300));
                                _items.removeAt(index);
                              },
                            );
                          },
                        ),
                      ],
                    )),
                SizedBox(
                  width: double.infinity,
                  child: QuinButton(
                    title: 'Create',
                    onTap: () {
                      showModalBottomSheet(
                        elevation: 10,
                        showDragHandle: true,
                        isDismissible: true,
                        enableDrag: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        context: context,
                        builder: (context) {
                          return SuccessDialog(
                            onClosed: () {
                              setState(() {
                                controller.text = '';
                                _items.clear();
                                selectedQuestionType = null;
                                lookupController.text = '';
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
