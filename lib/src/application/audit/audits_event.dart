part of 'audits_bloc.dart';

@freezed
class AuditsEvent with _$AuditsEvent {
  const factory AuditsEvent.fetch() = _Fetch;
  const factory AuditsEvent.fetchNextPage() = _FetchNextPage;
  const factory AuditsEvent.reset() = _Reset;
  const factory AuditsEvent.fetchOngoing() = _FetchOngoing;
  const factory AuditsEvent.fetchUpcoming() = _FetchUpcoming;
}
