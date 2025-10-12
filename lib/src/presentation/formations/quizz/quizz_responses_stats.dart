import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/quizz/models/quizz_item.dart';
import '../../../domain/quizz/models/quizz_submission.dart';
import '../widgets/quizz/quizz_stats_body.dart';

@RoutePage()
class QuizzResponsesStatsPage extends StatelessWidget {
  static const String routeName = '/quizz-responses-stats';
  final QuizzSubmissionResult result;
  final QuizzItem quizzItem;
  const QuizzResponsesStatsPage({
    super.key,
    required this.result,
    required this.quizzItem,
  });

  @override
  Widget build(BuildContext context) {
    return QuizzStatsBody(result: result, quizzItem: quizzItem);
  }
}
