import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/event/i_event_repository.dart';
import '../../../domain/event/models/cause_analysis.dart';
import '../../../domain/event/models/event_item.dart';

part 'event_detail_bloc.freezed.dart';
part 'event_detail_event.dart';
part 'event_detail_state.dart';

class EventDetailsBloc extends Bloc<EventDetailsEvent, EventDetailState> {
  final IEventRepository repository;
  EventDetailsBloc({required this.repository}) : super(EventDetailState.initial()) {
    on<_GetEventDetail>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          resultOption: none(),
          item: event.event,
        ),
      );

      final res = await repository.getCauseAnalysis(
        event: event.event.id,
      );

      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (causes) {
          emit(
            state.copyWith(
              isLoading: false,
              causes: causes,
              resultOption: some(right(causes)),
            ),
          );
        },
      );
    });

    on<_Reset>((event, emit) async {
      emit(EventDetailState.initial());
    });
  }
}
