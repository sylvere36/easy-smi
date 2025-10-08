part of 'inspections_bloc.dart';

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
  }) = _InspectionsState;

  factory InspectionsState.initial() => InspectionsState(
    isLoading: false,
    items: const [],
    currentPage: 1,
    perPage: 5,
    total: 0,
    canLoadMore: true,
    resultOption: none(),
  );
}
