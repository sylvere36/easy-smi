import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/action/i_action_repository.dart';
import '../../../domain/action/models/action_item.dart';

part 'action_detail_bloc.freezed.dart';
part 'action_detail_event.dart';
part 'action_detail_state.dart';

class ActionDetailBloc extends Bloc<ActionDetailEvent, ActionDetailState> {
  final IActionRepository repository;
  ActionDetailBloc({required this.repository})
    : super(ActionDetailState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none(), item: null));
      final res = await repository.getAction(id: event.id);
      emit(
        res.fold(
          (l) => state.copyWith(isLoading: false, resultOption: some(left(l))),
          (item) => state.copyWith(
            isLoading: false,
            item: item,
            resultOption: some(right(item)),
          ),
        ),
      );
    });
    on<_Reset>((event, emit) async {
      emit(state.copyWith(isLoading: false, resultOption: none(), item: null));
    });

    on<_RequestValidation>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final res = await repository.requestValidation(
        id: event.id,
        comment: event.comment,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (message) {
          // Keep current item; success message can be handled by UI via a separate side effect if needed
          emit(state.copyWith(isLoading: false));
        },
      );
    });

    on<_RequestRevision>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final res = await repository.requestRevision(id: event.id);
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (message) => emit(state.copyWith(isLoading: false)),
      );
    });

    on<_SubmitRevision>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final res = await repository.submitRevision(
        id: event.id,
        revisionComment: event.revisionComment,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (message) => emit(state.copyWith(isLoading: false)),
      );
    });

    on<_PrintRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final res = await repository.printActionDocument(id: event.id);
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (path) => emit(state.copyWith(isLoading: false)),
      );
    });
  }
}
