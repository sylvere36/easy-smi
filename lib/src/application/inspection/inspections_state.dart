part of 'inspections_bloc.dart';

// ignore_for_file: invalid_use_of_visible_for_testing_member

@freezed
abstract class InspectionsState with _$InspectionsState {
  const factory InspectionsState({
    required bool isLoading,
    required List<InspectionItem>? items,
    required int currentPage,
    required int perPage,
    required int total,
    required bool canLoadMore,
    required Option<Either<GlobalFailure, Paginated<InspectionItem>>>
    resultOption,
    // Inspection forms list (non-paginated)
    required bool isLoadingForms,
    required List<InspectionFormItem> forms,
    required Option<Either<GlobalFailure, List<InspectionFormItem>>>
    formsResultOption,
    // Available forms (with possible ongoing inspection id)
    required bool isLoadingFormsAvailable,
    required List<InspectionFormAvailableItem> formsAvailable,
    required Option<Either<GlobalFailure, List<InspectionFormAvailableItem>>>
    formsAvailableResultOption,
    // Create inspection
    required bool isCreating,
    required Option<Either<GlobalFailure, InspectionDetail>> createResultOption,
  }) = _InspectionsState;

  factory InspectionsState.initial() => InspectionsState(
    isLoading: false,
    items: const [],
    currentPage: 1,
    perPage: 5,
    total: 0,
    canLoadMore: true,
    resultOption: none(),
    isLoadingForms: false,
    forms: const [],
    formsResultOption: none(),
    isLoadingFormsAvailable: false,
    formsAvailable: const [],
    formsAvailableResultOption: none(),
    isCreating: false,
    createResultOption: none(),
  );
}
