part of 'formation_detail_bloc.dart';

@freezed
class FormationDetailEvent with _$FormationDetailEvent {
  const factory FormationDetailEvent.fetchRequested({required int id}) =
      _FetchRequested;
  const factory FormationDetailEvent.reset() = _Reset;
  const factory FormationDetailEvent.participantsRequested({required int id}) =
      _ParticipantsRequested;
  const factory FormationDetailEvent.coursesRequested({required int id}) =
      _CoursesRequested;
  const factory FormationDetailEvent.startCourseRequested({required int id}) =
      _StartCourseRequested;
  const factory FormationDetailEvent.finishCourseRequested({required int id}) =
      _FinishCourseRequested;
  const factory FormationDetailEvent.finishFormationRequested({
    required int id,
  }) = _FinishFormationRequested;

  const factory FormationDetailEvent.registerRequested({
    required Map<String, dynamic> body,
  }) = _RegisterRequested;
}
