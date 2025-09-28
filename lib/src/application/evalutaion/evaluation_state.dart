part of 'evaluation_bloc.dart';


@freezed
abstract class EvaluationsState with _$EvaluationsState {
  const factory EvaluationsState({
    required bool isLoading,
    required List<EvaluationItem>? items,
    required Option<Either<GlobalFailure, List<EvaluationItem>>> resultOption,
  }) = _EvaluationsState;

  factory EvaluationsState.initial() => EvaluationsState(
    isLoading: false,
    items: null,
    resultOption: none(),
  );
}
