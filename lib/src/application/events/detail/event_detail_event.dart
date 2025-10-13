part of 'event_detail_bloc.dart';

@freezed
class EventDetailsEvent with _$EventDetailsEvent {
  const factory EventDetailsEvent.getEvent({required EventItem event}) =
      _GetEventDetail;
  const factory EventDetailsEvent.reset() = _Reset;
  const factory EventDetailsEvent.requestValidation({
    required int id,
    String? comment,
  }) = _RequestValidation;
}
