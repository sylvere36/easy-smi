import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/event/i_event_repository.dart';
import '../../domain/event/models/event_item.dart';

part 'events_bloc.freezed.dart';
part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final IEventRepository repository;
  EventsBloc({required this.repository}) : super(EventsState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          items: null,
          currentPage: 1,
          canLoadMore: true,
        ),
      );
      final res = await repository.getEvents(
        perPage: /* (event.isHome ?? false) ? 3 : */ state.perPage,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (paginated) {
          final canLoadMore =
              paginated.pagination.currentPage < paginated.pagination.lastPage;
          emit(
            state.copyWith(
              isLoading: false,
              items: paginated.items,
              currentPage: paginated.pagination.currentPage,
              total: paginated.pagination.total,
              canLoadMore: canLoadMore,
              resultOption: some(right(paginated)),
            ),
          );
        },
      );
    });

    on<_FetchNextPage>((event, emit) async {
      if (!state.canLoadMore || state.isLoading) return;
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final nextPage = state.currentPage + 1;
      late final Either<GlobalFailure, Paginated<EventItem>> res;

      res = await repository.getEvents(page: nextPage, perPage: state.perPage);

      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (paginated) {
          final newItems = List<EventItem>.from(state.items ?? [])
            ..addAll(paginated.items);
          final canLoadMore =
              paginated.pagination.currentPage < paginated.pagination.lastPage;
          emit(
            state.copyWith(
              isLoading: false,
              items: newItems,
              currentPage: paginated.pagination.currentPage,
              total: paginated.pagination.total,
              canLoadMore: canLoadMore,
              resultOption: some(right(paginated)),
            ),
          );
        },
      );
    });

    on<_Reset>((event, emit) async {
      emit(EventsState.initial());
    });

    on<_AddEvent>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          hasAddEvent: false,
          errorMessage: null,
          newEvent: null,
        ),
      );

      final res = await repository.addEvent(
        title: event.title,
        description: event.description,
        type: event.type,
        gravity: event.gravity,
        files: event.files,
        date: event.date,
        site: event.site,
      );

      res.fold(
        (l) {
          String errorMessage = '';
          l.when(
            serverError: (errorText) {
              if (errorText != null) {
                errorMessage = errorText;
              }
            },
            unauthorized: (errorText) {
              errorMessage = errorText;
            },
            noNetwork: () {
              errorMessage = 'Pas de connexion';
            },
          );
          emit(
            state.copyWith(
              isLoading: false,
              hasAddEvent: false,
              errorMessage: errorMessage,
              newEvent: null,
            ),
          );
          emit(state.copyWith(errorMessage: null));
        },
        (r) {
          final List<EventItem> items = state.items ?? [];
          final newItems = List<EventItem>.from([r])..addAll(items);
          emit(
            state.copyWith(
              isLoading: false,
              hasAddEvent: true,
              errorMessage: null,
              newEvent: r,
              items: newItems,
            ),
          );
          emit(state.copyWith(hasAddEvent: false));
        },
      );
    });
  }
}
