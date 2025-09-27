part of 'events_bloc.dart';

@freezed
class EventsEvent with _$EventsEvent {
  const factory EventsEvent.fetch({bool? isHome}) = _Fetch;
  const factory EventsEvent.fetchNextPage() = _FetchNextPage;
  const factory EventsEvent.reset() = _Reset;
}
