import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quin/router/router_name.dart';
import 'package:quin/utils/theme.dart';
import 'package:quin/widgets/appbar.dart';
import 'package:quin/widgets/buttons.dart';

class QuestionnaireIntro extends StatefulWidget {
  const QuestionnaireIntro({super.key});

  @override
  State<QuestionnaireIntro> createState() => _QuestionnaireIntroState();
}

class _QuestionnaireIntroState extends State<QuestionnaireIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QuinAppbar(title: 'Start your response...', fontSize: 20),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Shared Z-Axis transition from search icon to search view page',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: colorScheme.onBackground),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    "In this step, we\'ll add a transition from the search icon to the full screen search view. Since there is no persistent container involved in this navigation change, we can use a Shared Z-Axis transition to reinforce the spatial relationship between the two screens and indicate moving one level upward in the app\'s hierarchy. Before adding additional code, try running the app and tapping the search icon at the bottom right corner of the screen. This should bring up the search view screen with no transition.",
                    style: TextStyle(
                        fontSize: 19, color: colorScheme.onSecondaryContainer),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: QuinButton(
                  title: 'Start Questionnaire',
                  onTap: () {
                    context.go(questionView);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
