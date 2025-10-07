import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../../domain/permit/models/permit_item.dart';
import 'widgets/risk_assessment_flow.dart';

@RoutePage()
class RiskAssessmentPage extends StatefulWidget {
  final PermitItem permit;
  static const String routeName = '/risk-assessment';
  const RiskAssessmentPage({super.key, required this.permit});

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
