part of 'events_bloc.dart';

@freezed
abstract class EventsState with _$EventsState {
  const factory EventsState({
    required bool isLoading,
    required List<EventItem>? items,
    required int currentPage,
    required int perPage,
    required int total,
    required bool canLoadMore,
    required Option<Either<GlobalFailure, Paginated<EventItem>>> resultOption,
  }) = _EventsState;

  factory EventsState.initial() => EventsState(
    isLoading: false,
    items: null,
    currentPage: 1,
    perPage: 10,
    total: 0,
    canLoadMore: true,
    resultOption: none(),
  );
}
