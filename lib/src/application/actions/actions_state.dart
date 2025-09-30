part of 'actions_bloc.dart';

@freezed
abstract class ActionsState with _$ActionsState {
  const factory ActionsState({
    required bool isLoading,
    required ActionItem? newAction,
    required bool hasAddAction,
    required String? errorMessage,
    required List<ActionItem>? items,
    required List<ActionItem>? initialItems,
    required List<ActionItem>? originItems,
    required Option<Either<GlobalFailure, List<ActionItem>>> resultOption,
  }) = _ActionsState;

  factory ActionsState.initial() => ActionsState(
    isLoading: false,
    items: null,
    newAction: null,
    hasAddAction: false,
    errorMessage: null,
    initialItems: null,
    originItems: null,
    resultOption: none(),
  );
}
