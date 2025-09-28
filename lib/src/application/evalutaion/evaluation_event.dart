part of 'evaluation_bloc.dart';

@freezed
class EvaluationsEvent with _$EvaluationsEvent {
  const factory EvaluationsEvent.fetch({required int event}) = _Fetch;
  const factory EvaluationsEvent.reset() = _Reset;
}
