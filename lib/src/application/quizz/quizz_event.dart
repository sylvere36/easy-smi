part of 'quizz_bloc.dart';

@freezed
abstract class QuizzEvent with _$QuizzEvent {
  const factory QuizzEvent.fetchRequested({int? page}) = _FetchRequested;
  const factory QuizzEvent.fetchDetailRequested({required int id}) =
      _FetchDetailRequested;
  const factory QuizzEvent.searchRequested({required String query}) =
      _SearchRequested;
  const factory QuizzEvent.submitRequested({
    required QuizzSubmissionRequest request,
  }) = _SubmitRequested;
}
