part of 'inspection_form_bloc.dart';

@freezed
abstract class InspectionFormState with _$InspectionFormState {
  const factory InspectionFormState({
    required bool isLoading,
    required List<InspectionSectionWithQuestions> sections,
    required Option<Either<GlobalFailure, List<InspectionSectionWithQuestions>>>
    resultOption,
    // Form detail
    required bool isLoadingDetail,
    required Option<Either<GlobalFailure, InspectionFormDetail>> detailResult,
    InspectionFormDetail? detail,
  }) = _InspectionFormState;

  factory InspectionFormState.initial() => InspectionFormState(
    isLoading: false,
    sections: const [],
    resultOption: none(),
    isLoadingDetail: false,
    detailResult: none(),
  );
}
