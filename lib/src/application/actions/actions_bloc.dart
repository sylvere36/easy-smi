import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/action/i_action_repository.dart';
import '../../domain/action/models/action_item.dart';

part 'actions_bloc.freezed.dart';
part 'actions_event.dart';
part 'actions_state.dart';

class ActionsBloc extends Bloc<ActionsEvent, ActionsState> {
  final IActionRepository repository;

  ActionsBloc({required this.repository}) : super(ActionsState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none(), items: null));
      final res = await repository.getActions();
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (items) => emit(
          state.copyWith(
            isLoading: false,
            items: items,
            resultOption: some(right(items)),
          ),
        ),
      );
    });
    on<_FetchByOrigin>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          originItems: null,
        ),
      );
      final res = await repository.getActionsByOrigin(
        originType: event.originType,
        originId: event.originId,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (items) => emit(
          state.copyWith(
            isLoading: false,
            originItems: items,
            resultOption: some(right(items)),
          ),
        ),
      );
    });
    on<_Reset>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: false,
          resultOption: none(),
          items: [],
          originItems: null,
        ),
      );
    });
  }
}
