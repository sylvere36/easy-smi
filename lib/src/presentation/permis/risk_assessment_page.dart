import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../../domain/permit/models/permit_item.dart';
import '../../domain/permit/models/permit_risk_assessment_request.dart';
import 'widgets/risk_assessment_flow.dart';

@RoutePage()
class RiskAssessmentPage extends StatefulWidget {
  final PermitItem permit;

  final List<PermitRiskAssessmentQuestionInput>? initialAnswers;
  final int? initialIndex;
  static const String routeName = '/risk-assessment';
  const RiskAssessmentPage({
    super.key,
    required this.permit,
    this.initialAnswers,
    this.initialIndex,
  });

  @override
  State<RiskAssessmentPage> createState() => _RiskAssessmentPageState();
}

class _RiskAssessmentPageState extends State<RiskAssessmentPage> {
  @override
  Widget build(BuildContext context) {
    return RiskAssessmentFlow(
      title: 'Absence de mise à jour des procédures',
      permit: widget.permit,
      initialAnswers: widget.initialAnswers,
      initialIndex: widget.initialIndex,
    );
  }
}
