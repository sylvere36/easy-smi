import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/action/i_action_repository.dart';
import '../../../domain/action/models/action_item.dart';
import '../../../domain/action/models/action_task.dart';

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

    on<_TasksRequested>((event, emit) async {
      emit(state.copyWith(isTasksLoading: true, tasksResultOption: none()));
      final res = await repository.getTasks(actionId: event.actionId);
      emit(
        res.fold(
          (l) => state.copyWith(
            isTasksLoading: false,
            tasksResultOption: some(left(l)),
          ),
          (tasks) => state.copyWith(
            isTasksLoading: false,
            tasks: tasks,
            tasksResultOption: some(right(tasks)),
          ),
        ),
      );
    });
  }
}
