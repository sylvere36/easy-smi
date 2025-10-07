part of 'permit_detail_bloc.dart';

@freezed
abstract class PermitDetailState with _$PermitDetailState {
  const factory PermitDetailState({
    required bool isLoading,
    required PermitDetail? item,
    required Option<Either<GlobalFailure, PermitDetail>> resultOption,
    // personnel pagination state
    required bool isLoadingPersonnel,
    required List<PermitPersonnelAssignment> personnel,
    required int personnelCurrentPage,
    required int personnelPerPage,
    required int personnelTotal,
    required bool personnelCanLoadMore,
    required Option<Either<GlobalFailure, Paginated<PermitPersonnelAssignment>>>
    personnelResultOption,
    // type controls pagination state
    required bool isLoadingTypeControls,
    required List<PermitTypeControl> typeControls,
    required int typeControlsCurrentPage,
    required int typeControlsPerPage,
    required int typeControlsTotal,
    required bool typeControlsCanLoadMore,
    required Option<Either<GlobalFailure, Paginated<PermitTypeControl>>>
    typeControlsResultOption,
    // fire controls pagination state
    required bool isLoadingFireControls,
    required List<PermitFireControl> fireControls,
    required int fireControlsCurrentPage,
    required int fireControlsPerPage,
    required int fireControlsTotal,
    required bool fireControlsCanLoadMore,
    required Option<Either<GlobalFailure, Paginated<PermitFireControl>>>
    fireControlsResultOption,
    // risk assessments pagination state
    required bool isLoadingRiskAssessments,
    required List<PermitRiskAssessment> riskAssessments,
    required int riskAssessmentsCurrentPage,
    required int riskAssessmentsPerPage,
    required int riskAssessmentsTotal,
    required bool riskAssessmentsCanLoadMore,
    required Option<Either<GlobalFailure, Paginated<PermitRiskAssessment>>>
    riskAssessmentsResultOption,
    // submit risk assessment state
    required bool isSubmittingRiskAssessment,
    required Option<Either<GlobalFailure, PermitRiskAssessment>>
    riskAssessmentSubmitResultOption,
  }) = _PermitDetailState;

  factory PermitDetailState.initial() => PermitDetailState(
    isLoading: false,
    item: null,
    resultOption: none(),
    isLoadingPersonnel: false,
    personnel: const [],
    personnelCurrentPage: 0,
    personnelPerPage: 20,
    personnelTotal: 0,
    personnelCanLoadMore: true,
    personnelResultOption: none(),
    isLoadingTypeControls: false,
    typeControls: const [],
    typeControlsCurrentPage: 0,
    typeControlsPerPage: 20,
    typeControlsTotal: 0,
    typeControlsCanLoadMore: true,
    typeControlsResultOption: none(),
    isLoadingFireControls: false,
    fireControls: const [],
    fireControlsCurrentPage: 0,
    fireControlsPerPage: 20,
    fireControlsTotal: 0,
    fireControlsCanLoadMore: true,
    fireControlsResultOption: none(),
    isLoadingRiskAssessments: false,
    riskAssessments: const [],
    riskAssessmentsCurrentPage: 0,
    riskAssessmentsPerPage: 15,
    riskAssessmentsTotal: 0,
    riskAssessmentsCanLoadMore: true,
    riskAssessmentsResultOption: none(),
    isSubmittingRiskAssessment: false,
    riskAssessmentSubmitResultOption: none(),
  );
}
