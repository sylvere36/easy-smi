import '../constants/risk_assessment_questions.dart';
import '../models/permit_risk_assessment_request.dart';

/// Build initial inputs for the risk assessment form, one per label.
List<PermitRiskAssessmentQuestionInput> buildDefaultRiskAssessmentInputs() {
  return kRiskAssessmentQuestionLabels
      .map(
        (label) => PermitRiskAssessmentQuestionInput(
          response: false,
          comment: '',
          questionTitle: label,
        ),
      )
      .toList();
}
