part of 'inspections_bloc.dart';

@freezed
class InspectionsEvent with _$InspectionsEvent {
  const factory InspectionsEvent.fetch() = _Fetch;
  const factory InspectionsEvent.fetchNextPage() = _FetchNext;
  const factory InspectionsEvent.reset() = _Reset;
  const factory InspectionsEvent.fetchInspectionForms() = _FetchForms;
  const factory InspectionsEvent.fetchInspectionFormsAvailable() =
      _FetchFormsAvailable;
}
