part of 'audit_detail_bloc.dart';

@freezed
class AuditDetailEvent with _$AuditDetailEvent {
  const factory AuditDetailEvent.fetchRequested({required int id}) =
      _FetchRequested;
  const factory AuditDetailEvent.reset() = _Reset;
  const factory AuditDetailEvent.changeStatus({
    required int id,
    required String status,
  }) = _ChangeStatus;
  const factory AuditDetailEvent.documentsRequested({required int id}) =
      _DocumentsRequested;

  const factory AuditDetailEvent.observationsRequested({
    required int id,
    int? page,
    int? perPage,
  }) = _ObservationsRequested;

  const factory AuditDetailEvent.observationsNextPageRequested({
    required int id,
  }) = _ObservationsNextPageRequested;

  const factory AuditDetailEvent.conclusionRequested({required int id}) =
      _ConclusionRequested;

  const factory AuditDetailEvent.fetchResults({required int id}) =
      _FetchResults;

  const factory AuditDetailEvent.addObservation({
    required int id,
    required String description,
    int? commentaireId,
    required List<String> documents,
  }) = _AddObservation;
}
