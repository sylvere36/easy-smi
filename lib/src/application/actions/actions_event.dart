part of 'actions_bloc.dart';

@freezed
class ActionsEvent with _$ActionsEvent {
  const factory ActionsEvent.fetch() = _Fetch;
  const factory ActionsEvent.reset() = _Reset;
  const factory ActionsEvent.fetchByOrigin({
    required String originType,
    required int originId,
  }) = _FetchByOrigin;
  const factory ActionsEvent.searchRequested({required String query}) =
      _SearchRequested;
  const factory ActionsEvent.addImmediateAction({
    required String name,
    required String type,
    required int originId,
    String? justificationType,
    String? justification,
  }) = _AddImmediateAction;
}
