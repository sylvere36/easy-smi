part of 'quizz_bloc.dart';

@freezed
abstract class QuizzState with _$QuizzState {
  const factory QuizzState({
    @Default(false) bool isLoading,
    @Default(<QuizzItem>[]) List<QuizzItem> items,
    @Default(<QuizzItem>[]) List<QuizzItem> initialItems,
    Pagination? pagination,
    required Option<Either<GlobalFailure, Paginated<QuizzItem>>> resultOption,
    @Default(false) bool isDetailLoading,
    QuizzItem? detail,
    required Option<Either<GlobalFailure, QuizzItem>> detailResultOption,
    // Submission state
    @Default(false) bool isSubmitting,
    QuizzSubmissionResult? lastSubmission,
    required Option<Either<GlobalFailure, QuizzSubmissionResult>>
    submitResultOption,
  }) = _QuizzState;

  factory QuizzState.initial() => QuizzState(
    resultOption: none(),
    detailResultOption: none(),
    submitResultOption: none(),
  );
}
