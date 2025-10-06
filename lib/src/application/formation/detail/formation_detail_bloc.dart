import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/formation/i_formation_repository.dart';
import '../../../domain/formation/models/formation_detail.dart';
import '../../../domain/formation/models/formation_participant_registration.dart';

part 'formation_detail_bloc.freezed.dart';
part 'formation_detail_event.dart';
part 'formation_detail_state.dart';

class FormationDetailBloc
    extends Bloc<FormationDetailEvent, FormationDetailState> {
  final IFormationRepository repository;
  FormationDetailBloc({required this.repository})
    : super(FormationDetailState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none(), item: null));
      final res = await repository.getFormation(id: event.id);
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (item) => emit(
          state.copyWith(
            isLoading: false,
            item: item,
            resultOption: some(right(item)),
          ),
        ),
      );
    });

    on<_Reset>((event, emit) async {
      emit(FormationDetailState.initial());
    });

    on<_ParticipantsRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingParticipants: true,
          participantsResultOption: none(),
        ),
      );
      final res = await repository.getFormationParticipants(id: event.id);
      emit(
        res.fold(
          (l) => state.copyWith(
            isLoadingParticipants: false,
            participantsResultOption: some(left(l)),
          ),
          (list) => state.copyWith(
            isLoadingParticipants: false,
            participants: list,
            participantsResultOption: some(right(list)),
          ),
        ),
      );
    });
  }
}
