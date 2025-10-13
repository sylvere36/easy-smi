part of 'event_detail_bloc.dart';

@freezed
abstract class EventDetailState with _$EventDetailState {
  const factory EventDetailState({
    required bool isLoading,
    required bool isLoadingValidation,
    required EventItem? item,
    required List<CauseAnalysis>? causes,
    bool? validationIsRequested,
    required Option<Either<GlobalFailure, List<CauseAnalysis>>> resultOption,
  }) = _EventDetailState;
  factory EventDetailState.initial() => EventDetailState(
    isLoading: false,
    isLoadingValidation: false,
    item: null,
    causes: null,
    resultOption: none(),
  );
}
