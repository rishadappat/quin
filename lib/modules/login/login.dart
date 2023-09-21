import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quin/gen/assets.gen.dart';
import 'package:quin/router/router_name.dart';
import 'package:quin/utils/theme.dart';
import 'package:quin/widgets/intro_screen_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Assets.quinIntro2
                  .image(fit: BoxFit.fitWidth, alignment: Alignment.topCenter),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Welcome to Quin',
                style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Create, edit, fill and evaluate beautiful questionnaires instantly from your device.',
                style: TextStyle(
                    color: colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: Hero(
                    tag: 'Create',
                    child: IntroScreenButton(
                      buttonTitle: 'Create',
                      icon: Icons.format_list_bulleted_add,
                      onTap: () {
                        context.go(questionnaireList);
                      },
                    ),
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: IntroScreenButton(
                    buttonTitle: 'Answer',
                    icon: Icons.fact_check_outlined,
                    onTap: () {
                      context.go(questionnaireList);
                    },
                  )),
                ],
              )
            ]),
          ),
        ));
  }
}
