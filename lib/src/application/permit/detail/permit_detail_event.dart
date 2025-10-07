part of 'permit_detail_bloc.dart';

@freezed
class PermitDetailEvent with _$PermitDetailEvent {
  const factory PermitDetailEvent.fetchRequested({required int id}) =
      _FetchRequested;
  const factory PermitDetailEvent.reset() = _Reset;
  const factory PermitDetailEvent.personnelRequested({required int id}) =
      _PersonnelRequested;
  const factory PermitDetailEvent.personnelNextPageRequested({
    required int id,
  }) = _PersonnelNextPageRequested;

  // Type controls
  const factory PermitDetailEvent.typeControlsRequested({required int id}) =
      _TypeControlsRequested;
  const factory PermitDetailEvent.typeControlsNextPageRequested({
    required int id,
  }) = _TypeControlsNextPageRequested;

  // Fire controls
  const factory PermitDetailEvent.fireControlsRequested({required int id}) =
      _FireControlsRequested;
  const factory PermitDetailEvent.fireControlsNextPageRequested({
    required int id,
  }) = _FireControlsNextPageRequested;

  // Risk assessments
  const factory PermitDetailEvent.riskAssessmentsRequested({required int id}) =
      _RiskAssessmentsRequested;
  const factory PermitDetailEvent.riskAssessmentsNextPageRequested({
    required int id,
  }) = _RiskAssessmentsNextPageRequested;

  // Submit a new risk assessment
  const factory PermitDetailEvent.riskAssessmentSubmitted({
    required int id,
    required int workPermitId,
    required int evaluatorId,
    required List<PermitRiskAssessmentQuestionInput> questions,
    required String status,
    required String conclusion,
  }) = _RiskAssessmentSubmitted;
}
