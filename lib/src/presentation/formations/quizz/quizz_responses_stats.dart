import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/quizz/quizz_stats_body.dart';

@RoutePage()
class QuizzResponsesStatsPage extends StatelessWidget {
  static const String routeName = '/quizz-responses-stats';
  const QuizzResponsesStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const QuizzStatsBody();
  }
}
