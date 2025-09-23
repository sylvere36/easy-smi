part of 'action_detail_bloc.dart';

@freezed
abstract class ActionDetailState with _$ActionDetailState {
  const factory ActionDetailState({
    required bool isLoading,
    required ActionItem? item,
    required Option<Either<GlobalFailure, ActionItem>> resultOption,
  }) = _ActionDetailState;

  factory ActionDetailState.initial() =>
      ActionDetailState(isLoading: false, item: null, resultOption: none());
}
