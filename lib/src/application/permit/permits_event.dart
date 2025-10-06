part of 'permits_bloc.dart';

@freezed
class PermitsEvent with _$PermitsEvent {
  const factory PermitsEvent.fetchRequested() = _FetchRequested;
  const factory PermitsEvent.fetchNextPage() = _FetchNextPage;
  const factory PermitsEvent.reset() = _Reset;
}
