import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quin/router/router_name.dart';

class QuestionnaireItem extends StatefulWidget {
  const QuestionnaireItem({super.key});

  @override
  State<QuestionnaireItem> createState() => _QuestionnaireItemState();
}

class _QuestionnaireItemState extends State<QuestionnaireItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push(questionnaireIntro);
      },
      style: ListTileStyle.list,
      title: const Text(
        'Questionnaire 1',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text('12 Questions'),
      leading: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.article_outlined,
            size: 40,
          ),
        ],
      ),
      trailing: const Text('4 Responses'),
    );
  }
}
