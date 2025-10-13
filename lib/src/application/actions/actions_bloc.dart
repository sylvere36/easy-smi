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
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          items: state.items,
          initialItems: state.items,
        ),
      );
      final res = await repository.getActions();
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (items) => emit(
          state.copyWith(
            isLoading: false,
            items: items,
            initialItems: items,
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
      emit(ActionsState.initial());
    });

    on<_SearchRequested>((event, emit) async {
      final query = event.query.trim().toLowerCase();
      if (query.isEmpty) {
        // Reset to initial items when query is empty
        emit(state.copyWith(items: state.initialItems));
      } else if (state.initialItems != null) {
        // Filter initial items based on query
        final filteredItems = state.initialItems!.where((item) {
          return item.actionName.toLowerCase().contains(query) ||
              (item.summary?.toLowerCase().contains(query) ?? false) ||
              (item.reference?.toLowerCase().contains(query) ?? false) ||
              (item.justification?.toLowerCase().contains(query) ?? false);
        }).toList();
        emit(state.copyWith(items: filteredItems));
      }
    });

    on<_AddImmediateAction>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          hasAddAction: false,
          errorMessage: null,
          newAction: null,
        ),
      );

      final res = await repository.addImmediateActions(
        name: event.name,
        originId: event.originId,
        type: event.type,
        justification: event.justification,
        justificationType: event.justificationType,
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
              hasAddAction: false,
              errorMessage: errorMessage,
              newAction: null,
            ),
          );
          emit(state.copyWith(errorMessage: null));
        },
        (r) {
          emit(
            state.copyWith(
              isLoading: false,
              hasAddAction: true,
              errorMessage: null,
              newAction: r,
            ),
          );
          emit(state.copyWith(hasAddAction: false));
        },
      );
    });
  }
}
