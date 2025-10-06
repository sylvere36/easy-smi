part of 'events_bloc.dart';

@freezed
class EventsEvent with _$EventsEvent {
  const factory EventsEvent.fetch({bool? isHome}) = _Fetch;
  const factory EventsEvent.fetchNextPage() = _FetchNextPage;
  const factory EventsEvent.reset() = _Reset;
  const factory EventsEvent.addEvent({
    required String title,
    required String description,
    DateTime? date,
    String? site,
    required String type,
    required String gravity,
    required List<String> files,
  }) = _AddEvent;
}
