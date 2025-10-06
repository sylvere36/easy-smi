part of 'permits_bloc.dart';

@freezed
abstract class PermitsState with _$PermitsState {
  const factory PermitsState({
    required bool isLoading,
    required List<PermitItem>? items,
    required int currentPage,
    required int perPage,
    required int total,
    required bool canLoadMore,
    required Option<Either<GlobalFailure, Paginated<PermitItem>>> resultOption,
  }) = _PermitsState;

  factory PermitsState.initial() => PermitsState(
    isLoading: false,
    items: const [],
    currentPage: 1,
    perPage: 10,
    total: 0,
    canLoadMore: true,
    resultOption: none(),
  );
}
