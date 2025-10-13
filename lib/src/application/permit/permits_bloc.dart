import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/permit/i_permit_repository.dart';
import '../../domain/permit/models/permit_item.dart';

part 'permits_bloc.freezed.dart';
part 'permits_event.dart';
part 'permits_state.dart';

class PermitsBloc extends Bloc<PermitsEvent, PermitsState> {
  final IPermitRepository repository;
  PermitsBloc({required this.repository}) : super(PermitsState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          items: state.items,
          currentPage: 1,
          canLoadMore: true,
        ),
      );
      final res = await repository.getPermits(page: 1, perPage: state.perPage);
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
      final res = await repository.getPermits(
        page: nextPage,
        perPage: state.perPage,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (paginated) {
          final newItems = List<PermitItem>.from(state.items ?? [])
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
      emit(PermitsState.initial());
    });
  }
}
