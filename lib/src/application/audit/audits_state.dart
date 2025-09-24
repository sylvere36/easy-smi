part of 'audits_bloc.dart';

@freezed
abstract class AuditsState with _$AuditsState {
  const factory AuditsState({
    required bool isLoading,
    required List<AuditItem> items,
    required int currentPage,
    required int perPage,
    required int total,
    required bool canLoadMore,
    required Option<Either<GlobalFailure, Paginated<AuditItem>>> resultOption,
    required AuditListMode mode,
  }) = _AuditsState;

  factory AuditsState.initial() => AuditsState(
        isLoading: false,
        items: const [],
        currentPage: 1,
        perPage: 10,
        total: 0,
        canLoadMore: true,
        resultOption: none(),
        mode: AuditListMode.all,
      );
}
