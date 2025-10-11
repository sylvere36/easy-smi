part of 'sliders_bloc.dart';

@freezed
abstract class SlidersState with _$SlidersState {
  const factory SlidersState({
    @Default(false) bool isLoading,
    @Default(<SliderItem>[]) List<SliderItem> items,
    Pagination? pagination,
    required Option<Either<GlobalFailure, Paginated<SliderItem>>> resultOption,
  }) = _SlidersState;

  factory SlidersState.initial() => SlidersState(resultOption: none());
}
