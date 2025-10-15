import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/inspection/i_inspection_repository.dart';
import '../../domain/inspection/models/inspection_form_available_item.dart';
import '../../domain/inspection/models/inspection_form_item.dart';
import '../../domain/inspection/models/inspection_item.dart';

part 'inspections_bloc.freezed.dart';
part 'inspections_event.dart';
part 'inspections_state.dart';

class InspectionsBloc extends Bloc<InspectionsEvent, InspectionsState> {
  final IInspectionRepository repository;
  InspectionsBloc({required this.repository})
    : super(InspectionsState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          items: state.items,
          currentPage: 1,
          canLoadMore: true,
        ),
      );
      final res = await repository.getInspections(
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

    on<_FetchNext>((event, emit) async {
      if (!state.canLoadMore || state.isLoading) return;
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final nextPage = state.currentPage + 1;
      final res = await repository.getInspections(
        page: nextPage,
        perPage: state.perPage,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (paginated) {
          final newItems = List<InspectionItem>.from(state.items ?? [])
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
      emit(InspectionsState.initial());
    });

    on<_FetchForms>((event, emit) async {
      emit(state.copyWith(isLoadingForms: true, formsResultOption: none()));
      final res = await repository.getInspectionForms();
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingForms: false,
            formsResultOption: some(left(l)),
          ),
        ),
        (forms) => emit(
          state.copyWith(
            isLoadingForms: false,
            forms: forms,
            formsResultOption: some(right(forms)),
          ),
        ),
      );
    });

    on<_FetchFormsAvailable>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingFormsAvailable: true,
          formsAvailableResultOption: none(),
        ),
      );
      final res = await repository.getInspectionFormsAvailable();
      res.fold(
        (l) => emit(
          state.copyWith(
            isLoadingFormsAvailable: false,
            formsAvailableResultOption: some(left(l)),
          ),
        ),
        (forms) => emit(
          state.copyWith(
            isLoadingFormsAvailable: false,
            formsAvailable: forms,
            formsAvailableResultOption: some(right(forms)),
          ),
        ),
      );
    });
  }
}
