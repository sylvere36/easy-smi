part of 'quizz_bloc.dart';

@freezed
abstract class QuizzState with _$QuizzState {
  const factory QuizzState({
    @Default(false) bool isLoading,
    @Default(<QuizzItem>[]) List<QuizzItem> items,
    Pagination? pagination,
    required Option<Either<GlobalFailure, Paginated<QuizzItem>>> resultOption,
    @Default(false) bool isDetailLoading,
    QuizzItem? detail,
    required Option<Either<GlobalFailure, QuizzItem>> detailResultOption,
  }) = _QuizzState;

  factory QuizzState.initial() =>
      QuizzState(resultOption: none(), detailResultOption: none());
}
