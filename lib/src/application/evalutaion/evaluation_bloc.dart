import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/evaluation/i_evaluation_repository.dart';
import '../../domain/evaluation/models/evaluation.dart';

part 'evaluation_bloc.freezed.dart';
part 'evaluation_event.dart';
part 'evaluation_state.dart';

class EvaluationsBloc extends Bloc<EvaluationsEvent, EvaluationsState> {
  final IEvaluationRepository repository;

  EvaluationsBloc({required this.repository}) : super(EvaluationsState.initial()) {

    on<_Fetch>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          items: null,
        ),
      );
      final res = await repository.getEventEvaluations(
        event: event.event,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (items) {
          emit(
            state.copyWith(
              isLoading: false,
              items: items,
              resultOption: some(right(items)),
            ),
          );
        },
      );
    });

    on<_Reset>((event, emit) async {
      emit(EvaluationsState.initial());
    });
  }
}
