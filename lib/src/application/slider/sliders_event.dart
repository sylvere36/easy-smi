part of 'sliders_bloc.dart';

@freezed
abstract class SlidersEvent with _$SlidersEvent {
  const factory SlidersEvent.fetchRequested({int? page}) = _FetchRequested;
}
