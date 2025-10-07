import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import 'widgets/risk_assessment_flow.dart';

@RoutePage()
class RiskAssessmentPage extends StatefulWidget {
  static const String routeName = '/risk-assessment';
  const RiskAssessmentPage({super.key});

  @override
  State<RiskAssessmentPage> createState() => _RiskAssessmentPageState();
}

class _RiskAssessmentPageState extends State<RiskAssessmentPage> {
  @override
  Widget build(BuildContext context) {
    return const RiskAssessmentFlow(
      title: 'Absence de mise à jour des procédures',
    );
  }
}
