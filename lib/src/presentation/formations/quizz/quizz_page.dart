import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/quizz/quizz_body.dart';

@RoutePage()
class QuizzPage extends StatelessWidget {
  static const String routeName = '/quizz';
  const QuizzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CertificationQuiz();
  }
}
