import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quin/modules/create_questionnaire/create_question.dart';
import 'package:quin/modules/create_questionnaire/create_questionnaire.dart';
import 'package:quin/modules/login/login.dart';
import 'package:quin/modules/questionnaire_intro/question_view.dart';
import 'package:quin/modules/questionnaire_intro/questionnaire_intro.dart';
import 'package:quin/modules/questionnaire_list/questionnaire_list.dart';
import 'package:quin/router/router_name.dart';
import 'package:quin/utils/transition.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');

final router = Provider.autoDispose<GoRouter>((ref) {
  return GoRouter(
      initialLocation: login,
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: login,
          pageBuilder: ((context, state) {
            return const SharedAxisTransitionPageWrapper(
              transitionKey: ValueKey('Login'),
              screen: Login(),
            );
          }),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: questionnaireList,
          pageBuilder: ((context, state) {
            return const MaterialPage(child: QuestionnaireList());
          }),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: createQuestionnaire,
          pageBuilder: ((context, state) {
            return const MaterialPage(child: CreateQuestionnaire());
          }),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: createQuestion,
          pageBuilder: ((context, state) {
            return const MaterialPage(child: CreateQuestion());
          }),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: questionnaireIntro,
          pageBuilder: ((context, state) {
            return const MaterialPage(child: QuestionnaireIntro());
          }),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: questionView,
          pageBuilder: ((context, state) {
            return const SharedAxisTransitionPageWrapper(
              transitionKey: ValueKey('QuestionView'),
              screen: QuestionView(),
            );
          }),
        ),
      ]);
});
