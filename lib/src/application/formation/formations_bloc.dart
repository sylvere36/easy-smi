import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/formation/i_formation_repository.dart';
import '../../domain/formation/models/formation_item.dart';
import '../../domain/formation/models/my_formation.dart';
import '../../domain/formation/models/user_formations_registrations.dart';

part 'formations_bloc.freezed.dart';
part 'formations_event.dart';
part 'formations_state.dart';

class FormationsBloc extends Bloc<FormationsEvent, FormationsState> {
  final IFormationRepository repository;
  FormationsBloc({required this.repository})
    : super(FormationsState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          items: [],
          currentPage: 1,
          canLoadMore: true,
        ),
      );
      final res = await repository.getFormations(
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
              itemsInitial: paginated.items,
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
      final res = await repository.getFormations(
        page: nextPage,
        perPage: state.perPage,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (paginated) {
          final newItems = List<FormationItem>.from(state.items)
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

    // Fetch My Formations (no pagination)
    on<_FetchMyFormationsRequested>((event, emit) async {
      log('Fetching my formations...');
      emit(
        state.copyWith(
          isLoadingMyFormations: true,
          resultOption: none(),
          itemsMyFormations: [],
          currentPage: 1,
          canLoadMore: false,
        ),
      );
      final res = await repository.getMyFormations();
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingMyFormations: false,
            resultOptionMyFormations: some(left(l)),
          ),
        ),
        (list) {
          // Wrap into Paginated for state.resultOption consistency
          final paginated = Paginated(
            items: list
                .map(
                  (mf) => FormationItem(
                    id: mf.formation.id,
                    title: mf.formation.title,
                    trainerName: '',
                    image: mf.formation.imageUrl ?? mf.formation.image,
                    deliveryMode: mf.formation.deliveryMode,
                  ),
                )
                .toList(),
            pagination: Pagination(
              total: list.length,
              perPage: list.length,
              currentPage: 1,
              lastPage: 1,
            ),
          );
          emit(
            state.copyWith(
              isLoadingMyFormations: false,
              itemsMyFormations: list,
              itemsMyFormationsInitial: list,
              currentPageMyFormations: 1,
              totalMyFormations: paginated.pagination.total,
              canLoadMoreMyFormations: false,
              resultOptionMyFormations: some(right(paginated)),
            ),
          );
        },
      );
    });

    on<_SearchFormationRequested>((event, emit) async {
      log('Searching formations with query: ${event.query}');
      final query = event.query.trim().toLowerCase();
      if (query.isEmpty) {
        // Reset to initial items when query is empty
        emit(state.copyWith(items: state.itemsInitial));
      } else {
        // Filter initial items based on query
        final filteredItems = state.itemsInitial.where((item) {
          return item.title.toLowerCase().contains(query) ||
              (item.trainerName.toLowerCase().contains(query)) ||
              (item.deliveryMode.toLowerCase().contains(query));
        }).toList();
        emit(state.copyWith(items: filteredItems));
      }
    });

    on<_SearchMyFormationsRequested>((event, emit) async {
      log('Searching my formations with query: ${event.query}');
      final query = event.query.trim().toLowerCase();
      if (query.isEmpty) {
        // Reset to initial items when query is empty
        emit(state.copyWith(itemsMyFormations: state.itemsMyFormationsInitial));
      } else {
        // Filter initial items based on query
        final filteredItems = state.itemsMyFormationsInitial.where((item) {
          return item.formation.title.toLowerCase().contains(query) ||
              (item.formation.deliveryMode.toLowerCase().contains(query));
        }).toList();
        emit(state.copyWith(itemsMyFormations: filteredItems));
      }
    });

    // Fetch user registrations summary (profile -> formations registrations)
    on<_FetchUserRegistrationsRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingUserRegistrations: true,
          resultOptionUserRegistrations: none(),
        ),
      );
      final res = await repository.getUserFormationsRegistrations();
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingUserRegistrations: false,
            resultOptionUserRegistrations: some(left(l)),
          ),
        ),
        (summary) => emit(
          state.copyWith(
            isLoadingUserRegistrations: false,
            resultOptionUserRegistrations: some(right(summary)),
          ),
        ),
      );
    });

    on<_Reset>((event, emit) async {
      emit(FormationsState.initial());
    });
  }
}
