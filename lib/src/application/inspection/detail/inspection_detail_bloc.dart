import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/inspection/i_inspection_repository.dart';
import '../../../domain/inspection/models/inspection_answers_post.dart';
import '../../../domain/inspection/models/inspection_detail.dart';

part 'inspection_detail_bloc.freezed.dart';
part 'inspection_detail_event.dart';
part 'inspection_detail_state.dart';

class InspectionDetailBloc
    extends Bloc<InspectionDetailEvent, InspectionDetailState> {
  final IInspectionRepository repository;
  InspectionDetailBloc({required this.repository})
    : super(InspectionDetailState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none(), item: null));
      final res = await repository.getInspection(id: event.id);
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (item) => emit(
          state.copyWith(
            isLoading: false,
            item: item,
            resultOption: some(right(item)),
          ),
        ),
      );
    });

    on<_Reset>((event, emit) async {
      emit(InspectionDetailState.initial());
    });

    on<_PostAnswers>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final res = await repository.postInspectionAnswers(
        inspectionId: event.id,
        body: event.body,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (detail) {
          emit(
            state.copyWith(
              isLoading: false,
              item: detail,
              answerIsPosted: true,
              resultOption: some(right(detail)),
            ),
          );
          emit(state.copyWith(answerIsPosted: null));
        },
      );
    });

    on<_AddRemark>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final res = await repository.postInspectionRemarks(
        inspectionId: event.id,
        otherRemark: event.otherRemark,
        recommendation: event.recommendation,
      );
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (detail) {
          emit(
            state.copyWith(
              isLoading: false,
              item: detail,
              remarkIsPosted: true,
              resultOption: some(right(detail)),
            ),
          );
          emit(state.copyWith(remarkIsPosted: null));
        },
      );
    });
  }
}
