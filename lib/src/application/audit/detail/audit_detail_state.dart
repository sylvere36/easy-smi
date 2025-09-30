part of 'audit_detail_bloc.dart';

@freezed
abstract class AuditDetailState with _$AuditDetailState {
  const factory AuditDetailState({
    required bool isLoading,
    required AuditItem? item,
    required Option<Either<GlobalFailure, AuditItem>> resultOption,
    @Default(false) bool isLoadingDocuments,
    @Default([]) List<AuditDocumentRequest> documentRequests,
    required Option<Either<GlobalFailure, List<AuditDocumentRequest>>>
    documentsResultOption,
  }) = _AuditDetailState;

  factory AuditDetailState.initial() => AuditDetailState(
    isLoading: false,
    item: null,
    resultOption: none(),
    documentsResultOption: none(),
  );
}
