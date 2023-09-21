import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quin/router/router_name.dart';
import 'package:quin/utils/theme.dart';
import 'package:quin/widgets/appbar.dart';
import 'package:quin/widgets/question/questionnaire_item.dart';

class QuestionnaireList extends StatefulWidget {
  const QuestionnaireList({super.key});

  @override
  State<QuestionnaireList> createState() => _QuestionnaireListState();
}

class _QuestionnaireListState extends State<QuestionnaireList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: const QuinAppbar(title: 'Quin', fontSize: 30),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: 'Create',
          backgroundColor: colorScheme.primary,
          onPressed: () {
            context.push(createQuestionnaire);
          },
          label: const Text('Add'),
          icon: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: ListView(
          children: [
            ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: 70,
                    thickness: 2,
                    color: colorScheme.secondaryContainer,
                  );
                },
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const QuestionnaireItem();
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total questionnaires: 20',
                      style:
                          TextStyle(color: colorScheme.secondary, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
