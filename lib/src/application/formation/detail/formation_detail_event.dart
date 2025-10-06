part of 'formation_detail_bloc.dart';

@freezed
class FormationDetailEvent with _$FormationDetailEvent {
  const factory FormationDetailEvent.fetchRequested({required int id}) =
      _FetchRequested;
  const factory FormationDetailEvent.reset() = _Reset;
  const factory FormationDetailEvent.participantsRequested({required int id}) =
      _ParticipantsRequested;
}
