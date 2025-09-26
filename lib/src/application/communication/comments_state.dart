part of 'comments_bloc.dart';

@freezed
abstract class CommentsState with _$CommentsState {
  const factory CommentsState({
    required bool isLoading,
    required List<CommentItem> items,
    required Option<Either<GlobalFailure, List<CommentItem>>> resultOption,
    required bool isSubmitting,
    required Option<Either<GlobalFailure, CommentItem>> submitResultOption,
    required bool isReacting,
    required Option<Either<GlobalFailure, Unit>> reactionResultOption,
  }) = _CommentsState;

  factory CommentsState.initial() => CommentsState(
    isLoading: false,
    items: const [],
    resultOption: none(),
    isSubmitting: false,
    submitResultOption: none(),
    isReacting: false,
    reactionResultOption: none(),
  );
}
