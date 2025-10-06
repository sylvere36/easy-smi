part of 'formation_detail_bloc.dart';

@freezed
abstract class FormationDetailState with _$FormationDetailState {
  const factory FormationDetailState({
    required bool isLoading,
    required FormationDetail? item,
    required Option<Either<GlobalFailure, FormationDetail>> resultOption,
    @Default(false) bool isLoadingParticipants,
    @Default([]) List<FormationParticipantRegistration> participants,
    required Option<
      Either<GlobalFailure, List<FormationParticipantRegistration>>
    >
    participantsResultOption,
  }) = _FormationDetailState;

  factory FormationDetailState.initial() => FormationDetailState(
    isLoading: false,
    item: null,
    resultOption: none(),
    participantsResultOption: none(),
  );
}
