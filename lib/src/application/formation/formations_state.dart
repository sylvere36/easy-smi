part of 'formations_bloc.dart';

@freezed
abstract class FormationsState with _$FormationsState {
  const factory FormationsState({
    required bool isLoading,
    required List<FormationItem> items,
    required int currentPage,
    required int perPage,
    required int total,
    required bool canLoadMore,
    required Option<Either<GlobalFailure, Paginated<FormationItem>>>
    resultOption,
  }) = _FormationsState;

  factory FormationsState.initial() => FormationsState(
    isLoading: false,
    items: const [],
    currentPage: 1,
    perPage: 10,
    total: 0,
    canLoadMore: true,
    resultOption: none(),
  );
}
