part of 'action_detail_bloc.dart';

@freezed
class ActionDetailEvent with _$ActionDetailEvent {
  const factory ActionDetailEvent.fetchRequested({required int id}) =
      _FetchRequested;
  const factory ActionDetailEvent.reset() = _Reset;

  // Command events
  const factory ActionDetailEvent.requestValidation({
    required int id,
    String? comment,
  }) = _RequestValidation;

  const factory ActionDetailEvent.requestRevision({required int id}) =
      _RequestRevision;

  const factory ActionDetailEvent.submitRevision({
    required int id,
    String? revisionComment,
  }) = _SubmitRevision;

  const factory ActionDetailEvent.printRequested({required int id}) =
      _PrintRequested;

  // Tasks
  const factory ActionDetailEvent.tasksRequested({required int actionId}) =
      _TasksRequested;
}
