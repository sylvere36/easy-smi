part of 'inspection_form_bloc.dart';

@freezed
abstract class InspectionFormEvent with _$InspectionFormEvent {
  const factory InspectionFormEvent.fetch({required int inspectionFormId}) =
      _Fetch;
  const factory InspectionFormEvent.reset() = _Reset;
}
