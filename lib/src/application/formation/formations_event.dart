part of 'formations_bloc.dart';

@freezed
class FormationsEvent with _$FormationsEvent {
  const factory FormationsEvent.fetchRequested() = _FetchRequested;
  const factory FormationsEvent.fetchNextPage() = _FetchNextPage;
  const factory FormationsEvent.fetchMyFormationsRequested() =
      _FetchMyFormationsRequested;
  const factory FormationsEvent.reset() = _Reset;
}
