import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class RiskAssessmentResultPage extends StatefulWidget {
  static const String routeName = '/risk-assessment-result';
  const RiskAssessmentResultPage({super.key});

  @override
  State<RiskAssessmentResultPage> createState() =>
      _RiskAssessmentResultPageState();
}

class _RiskAssessmentResultPageState extends State<RiskAssessmentResultPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
