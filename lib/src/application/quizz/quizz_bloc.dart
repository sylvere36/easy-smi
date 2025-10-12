import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/quizz/i_quizz_repository.dart';
import '../../domain/quizz/models/quizz_item.dart';
import '../../domain/quizz/models/quizz_submission.dart';

part 'quizz_bloc.freezed.dart';
part 'quizz_event.dart';
part 'quizz_state.dart';

class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  final IQuizzRepository repository;
  QuizzBloc({required this.repository}) : super(QuizzState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final int page = event.page ?? 1;
      final res = await repository.getQuizzes(page: page);
      res.fold(
        (l) =>
            emit(state.copyWith(isLoading: false, resultOption: some(left(l)))),
        (paginated) => emit(
          state.copyWith(
            isLoading: false,
            items: paginated.items,
            initialItems: paginated.items,
            pagination: paginated.pagination,
            resultOption: some(right(paginated)),
          ),
        ),
      );
    });

    on<_SearchRequested>((event, emit) async {
      final query = event.query.trim().toLowerCase();
      if (query.isEmpty) {
        // Reset to initial items when query is empty
        emit(state.copyWith(items: state.initialItems));
      } else {
        // Filter initial items based on query
        final filteredItems = state.initialItems.where((item) {
          return item.title.toLowerCase().contains(query) ||
              (item.descriptionHtml?.toLowerCase().contains(query) ?? false);
        }).toList();
        emit(state.copyWith(items: filteredItems));
      }
    });

    on<_FetchDetailRequested>((event, emit) async {
      emit(state.copyWith(isDetailLoading: true, detailResultOption: none()));
      final res = await repository.getQuizzDetail(id: event.id);
      res.fold(
        (l) => emit(
          state.copyWith(
            isDetailLoading: false,
            detailResultOption: some(left(l)),
          ),
        ),
        (item) => emit(
          state.copyWith(
            isDetailLoading: false,
            detail: item,
            detailResultOption: some(right(item)),
          ),
        ),
      );
    });

    on<_SubmitRequested>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, submitResultOption: none()));
      final res = await repository.submitQuizzAnswers(request: event.request);
      res.fold(
        (l) => emit(
          state.copyWith(
            isSubmitting: false,
            submitResultOption: some(left(l)),
          ),
        ),
        (result) => emit(
          state.copyWith(
            isSubmitting: false,
            lastSubmission: result,
            submitResultOption: some(right(result)),
          ),
        ),
      );
    });
  }
}
