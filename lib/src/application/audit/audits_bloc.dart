import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/audit/i_audit_repository.dart';
import '../../domain/audit/models/audit_item.dart';

part 'audits_bloc.freezed.dart';
part 'audits_event.dart';
part 'audits_state.dart';

enum AuditListMode { all, ongoing, upcoming }

class AuditsBloc extends Bloc<AuditsEvent, AuditsState> {
  final IAuditRepository repository;
  AuditsBloc({required this.repository}) : super(AuditsState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          items: state.items,
          currentPage: 1,
          canLoadMore: true,
          mode: AuditListMode.all,
        ),
      );
      final res = await repository.getAudits(page: 1, perPage: state.perPage);
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoading: false,
            items: [],
            resultOption: some(left(l)),
          ),
        ),
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
      late final Either<GlobalFailure, Paginated<AuditItem>> res;
      if (state.mode == AuditListMode.all) {
        res = await repository.getAudits(
          page: nextPage,
          perPage: state.perPage,
        );
      } else if (state.mode == AuditListMode.ongoing) {
        res = await repository.getOngoingAudits(
          page: nextPage,
          perPage: state.perPage,
        );
      } else {
        res = await repository.getUpcomingAudits(
          page: nextPage,
          perPage: state.perPage,
        );
      }
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (paginated) {
          final newItems = List<AuditItem>.from(state.items ?? [])
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
      emit(AuditsState.initial());
    });

    on<_FetchOngoing>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          items: [],
          currentPage: 1,
          canLoadMore: true,
          mode: AuditListMode.ongoing,
        ),
      );
      final res = await repository.getOngoingAudits(
        page: 1,
        perPage: state.perPage,
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

    on<_FetchUpcoming>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          items: [],
          currentPage: 1,
          canLoadMore: true,
          mode: AuditListMode.upcoming,
        ),
      );
      final res = await repository.getUpcomingAudits(
        page: 1,
        perPage: state.perPage,
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
  }
}
