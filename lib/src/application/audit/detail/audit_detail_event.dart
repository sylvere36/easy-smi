part of 'audit_detail_bloc.dart';

@freezed
class AuditDetailEvent with _$AuditDetailEvent {
  const factory AuditDetailEvent.fetchRequested({required int id}) = _FetchRequested;
  const factory AuditDetailEvent.reset() = _Reset;
  const factory AuditDetailEvent.changeStatus({required int id, required String status}) = _ChangeStatus;
}
