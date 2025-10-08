import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/inspection/i_inspection_repository.dart';
import '../../../domain/inspection/models/inspection_detail.dart'
    show InspectionSectionWithQuestions;

part 'inspection_form_bloc.freezed.dart';
part 'inspection_form_event.dart';
part 'inspection_form_state.dart';

class InspectionFormBloc
    extends Bloc<InspectionFormEvent, InspectionFormState> {
  final IInspectionRepository repository;
  InspectionFormBloc({required this.repository})
    : super(InspectionFormState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none(), sections: []));
      final res = await repository.getInspectionFormSections(
        inspectionFormId: event.inspectionFormId,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (sections) => emit(
          state.copyWith(
            isLoading: false,
            sections: sections,
            resultOption: some(right(sections)),
          ),
        ),
      );
    });

    on<_Reset>((event, emit) => emit(InspectionFormState.initial()));
  }
}
