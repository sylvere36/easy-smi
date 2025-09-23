part of 'actions_bloc.dart';

@freezed
abstract class ActionsState with _$ActionsState {
  const factory ActionsState({
    required bool isLoading,
    required List<ActionItem> items,
    required Option<Either<GlobalFailure, List<ActionItem>>> resultOption,
  }) = _ActionsState;

  factory ActionsState.initial() =>
      ActionsState(isLoading: false, items: const [], resultOption: none());
}
