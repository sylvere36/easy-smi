part of 'action_detail_bloc.dart';

@freezed
abstract class ActionDetailState with _$ActionDetailState {
  const factory ActionDetailState({
    required bool isLoading,
    required ActionItem? item,
    required Option<Either<GlobalFailure, ActionItem>> resultOption,
    // Tasks related
    required bool isTasksLoading,
    required List<ActionTask> tasks,
    required Option<Either<GlobalFailure, List<ActionTask>>> tasksResultOption,
  }) = _ActionDetailState;

  factory ActionDetailState.initial() => ActionDetailState(
    isLoading: false,
    item: null,
    resultOption: none(),
    isTasksLoading: false,
    tasks: const [],
    tasksResultOption: none(),
  );
}
