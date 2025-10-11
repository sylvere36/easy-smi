import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/slider/i_slider_repository.dart';
import '../../domain/slider/models/slider_item.dart';

part 'sliders_bloc.freezed.dart';
part 'sliders_event.dart';
part 'sliders_state.dart';

class SlidersBloc extends Bloc<SlidersEvent, SlidersState> {
  final ISliderRepository repository;
  SlidersBloc({required this.repository}) : super(SlidersState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final page = event.page ?? 1;
      final res = await repository.getSliders(page: page);
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (paginated) => emit(
          state.copyWith(
            isLoading: false,
            items: paginated.items,
            pagination: paginated.pagination,
            resultOption: some(right(paginated)),
          ),
        ),
      );
    });
  }
}
