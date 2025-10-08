part of 'inspection_detail_bloc.dart';

@freezed
abstract class InspectionDetailState with _$InspectionDetailState {
  const factory InspectionDetailState({
    required bool isLoading,
    required InspectionDetail? item,
    required Option<Either<GlobalFailure, InspectionDetail>> resultOption,
  }) = _InspectionDetailState;

  factory InspectionDetailState.initial() =>
      InspectionDetailState(isLoading: false, item: null, resultOption: none());
}
