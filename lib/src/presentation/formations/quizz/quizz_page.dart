import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/quizz/models/quizz_item.dart';
import '../widgets/quizz/quizz_body.dart';

@RoutePage()
class QuizzPage extends StatelessWidget {
  static const String routeName = '/quizz';
  final QuizzItem quizzItem;
  const QuizzPage({super.key, required this.quizzItem});

  @override
  Widget build(BuildContext context) {
    return CertificationQuiz(quizzItem: quizzItem);
  }
}
