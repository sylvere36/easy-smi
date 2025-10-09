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
    // Observations
    @Default(false) bool isLoadingObservations,
    @Default([]) List<AuditObservation> observations,
    Pagination? observationsPagination,
    required Option<Either<GlobalFailure, Paginated<AuditObservation>>>
    observationsResultOption,
    // Conclusion
    @Default(false) bool isLoadingConclusion,
    AuditConclusion? conclusion,
    required Option<Either<GlobalFailure, AuditConclusion>>
    conclusionResultOption,
    // Results
    @Default(false) bool isLoadingResults,
    @Default([]) List<AuditResult> results,
    required Option<Either<GlobalFailure, List<AuditResult>>>
    resultsResultOption,
    // Add observation
    @Default(false) bool isAddingObservation,
    required Option<Either<GlobalFailure, AuditObservation>>
    addObservationResultOption,
  }) = _AuditDetailState;

  factory AuditDetailState.initial() => AuditDetailState(
    isLoading: false,
    item: null,
    resultOption: none(),
    documentsResultOption: none(),
    observationsResultOption: none(),
    conclusionResultOption: none(),
    resultsResultOption: none(),
    addObservationResultOption: none(),
  );
}
