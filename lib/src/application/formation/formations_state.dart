part of 'formations_bloc.dart';

@freezed
abstract class FormationsState with _$FormationsState {
  const factory FormationsState({
    required bool isLoading,
    required bool isLoadingMyFormations,
    required bool isLoadingUserRegistrations,
    required List<FormationItem> items,
    required List<FormationItem> itemsInitial,
    required List<MyFormation> itemsMyFormations,
    required List<MyFormation> itemsMyFormationsInitial,
    required Option<Either<GlobalFailure, UserFormationsRegistrations>>
    resultOptionUserRegistrations,
    required int currentPage,
    required int currentPageMyFormations,
    required int perPage,
    required int perPageMyFormations,
    required int total,
    required int totalMyFormations,
    required bool canLoadMore,
    required bool canLoadMoreMyFormations,
    required Option<Either<GlobalFailure, Paginated<FormationItem>>>
    resultOption,
    required Option<Either<GlobalFailure, Paginated<FormationItem>>>
    resultOptionMyFormations,
  }) = _FormationsState;

  factory FormationsState.initial() => FormationsState(
    isLoading: false,
    items: const [],
    itemsInitial: const [],
    itemsMyFormations: const [],
    itemsMyFormationsInitial: const [],
    isLoadingUserRegistrations: false,
    resultOptionUserRegistrations: none(),
    currentPage: 1,
    perPage: 10,
    total: 0,
    canLoadMore: true,
    resultOption: none(),
    resultOptionMyFormations: none(),
    isLoadingMyFormations: false,
    currentPageMyFormations: 1,
    perPageMyFormations: 10,
    totalMyFormations: 0,
    canLoadMoreMyFormations: false,
  );
}
