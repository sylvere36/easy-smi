part of 'inspection_detail_bloc.dart';

@freezed
class InspectionDetailEvent with _$InspectionDetailEvent {
  const factory InspectionDetailEvent.fetch({required int id}) = _Fetch;
  const factory InspectionDetailEvent.reset() = _Reset;
}
