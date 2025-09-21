import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/quizz/quizz_responses_body.dart';

@RoutePage()
class QuizzResponsesPage extends StatelessWidget {
  static const String routeName = '/quizz-responses';
  const QuizzResponsesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const QuizzResponseBody();
  }
}