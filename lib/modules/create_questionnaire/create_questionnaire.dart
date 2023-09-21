import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quin/router/router_name.dart';
import 'package:quin/widgets/appbar.dart';
import 'package:quin/widgets/buttons.dart';
import 'package:quin/widgets/form_textfield.dart';

class CreateQuestionnaire extends StatefulWidget {
  const CreateQuestionnaire({super.key});

  @override
  State<CreateQuestionnaire> createState() => _CreateQuestionnaireState();
}

class _CreateQuestionnaireState extends State<CreateQuestionnaire> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();

    return Scaffold(
      appBar: const QuinAppbar(
        title: 'Create Questionnaire',
        fontSize: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTextField(
                onChanged: (p0) {},
                placeHolder: 'Questionnaire Title',
                isMultiline: false,
                controller: titleController,
              ),
              const SizedBox(
                height: 30,
              ),
              FormTextField(
                onChanged: (p0) {},
                placeHolder: 'Description',
                isMultiline: true,
                controller: descController,
              ),
              const Spacer(),
              SizedBox(
                  width: double.infinity, // <-- Your width
                  height: 50, // <-- Your height
                  child: Hero(
                    tag: 'Create',
                    child: QuinButton(
                      title: 'Create',
                      onTap: () {
                        context.push(createQuestion);
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
