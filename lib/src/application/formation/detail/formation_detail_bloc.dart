import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/_commons/global_failure.dart';
import '../../../domain/formation/i_formation_repository.dart';
import '../../../domain/formation/models/finish_course_result.dart';
import '../../../domain/formation/models/finish_formation_result.dart';
import '../../../domain/formation/models/formation_course.dart';
import '../../../domain/formation/models/formation_detail.dart';
import '../../../domain/formation/models/formation_participant_registration.dart';
import '../../../domain/formation/models/start_course_result.dart';

part 'formation_detail_bloc.freezed.dart';
part 'formation_detail_event.dart';
part 'formation_detail_state.dart';

class FormationDetailBloc
    extends Bloc<FormationDetailEvent, FormationDetailState> {
  final IFormationRepository repository;
  FormationDetailBloc({required this.repository})
    : super(FormationDetailState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none(), item: null));
      final res = await repository.getFormation(id: event.id);
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
      emit(FormationDetailState.initial());
    });

    on<_ParticipantsRequested>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingParticipants: true,
          participantsResultOption: none(),
        ),
      );
      final res = await repository.getFormationParticipants(id: event.id);
      emit(
        res.fold(
          (l) => state.copyWith(
            isLoadingParticipants: false,
            participantsResultOption: some(left(l)),
          ),
          (list) => state.copyWith(
            isLoadingParticipants: false,
            participants: list,
            participantsResultOption: some(right(list)),
          ),
        ),
      );
    });

    on<_CoursesRequested>((event, emit) async {
      emit(state.copyWith(isLoadingCourses: true, coursesResultOption: none()));
      final res = await repository.getFormationCourses(id: event.id);
      emit(
        res.fold(
          (l) => state.copyWith(
            isLoadingCourses: false,
            coursesResultOption: some(left(l)),
          ),
          (list) => state.copyWith(
            isLoadingCourses: false,
            courses: list,
            coursesResultOption: some(right(list)),
          ),
        ),
      );
    });

    on<_StartCourseRequested>((event, emit) async {
      emit(
        state.copyWith(isStartingCourse: true, startCourseResultOption: none()),
      );
      final res = await repository.startCourse(id: event.id);
      res.fold(
        (l) => emit(
          state.copyWith(
            isStartingCourse: false,
            startCourseResultOption: some(left(l)),
          ),
        ),
        (r) {
          emit(
            state.copyWith(
              isStartingCourse: false,
              startCourseResultOption: some(right(r)),
            ),
          );

          add(_FetchRequested(id: event.id));
          add(_CoursesRequested(id: event.id));
        },
      );
    });

    on<_FinishCourseRequested>((event, emit) async {
      emit(
        state.copyWith(
          isFinishingCourse: true,
          finishCourseResultOption: none(),
        ),
      );
      final res = await repository.finishCourse(id: event.id);

      res.fold(
        (l) => emit(
          state.copyWith(
            isFinishingCourse: false,
            finishCourseResultOption: some(left(l)),
          ),
        ),
        (r) {
          emit(
            state.copyWith(
              isFinishingCourse: false,
              finishCourseResultOption: some(right(r)),
            ),
          );

          add(_FetchRequested(id: event.id));
          add(_CoursesRequested(id: event.id));
        },
      );
    });

    on<_FinishFormationRequested>((event, emit) async {
      emit(
        state.copyWith(
          isFinishingFormation: true,
          finishFormationResultOption: none(),
        ),
      );
      final res = await repository.finishFormation(id: event.id);

      res.fold(
        (l) => emit(
          state.copyWith(
            isFinishingFormation: false,
            finishFormationResultOption: some(left(l)),
          ),
        ),
        (r) {
          emit(
            state.copyWith(
              isFinishingFormation: false,
              finishFormationResultOption: some(right(r)),
            ),
          );
          emit(state.copyWith(isFinishingFormation: null));

          add(_FetchRequested(id: event.id));
          add(_CoursesRequested(id: event.id));
        },
      );
    });

    on<_RegisterRequested>((event, emit) async {
      emit(state.copyWith(isRegistering: true, registerResultOption: none()));
      final res = await repository.registerToFormation(body: event.body);
      emit(
        res.fold(
          (l) => state.copyWith(
            isRegistering: false,
            registerResultOption: some(left(l)),
          ),
          (r) => state.copyWith(
            isRegistering: false,
            registerResultOption: some(right(r)),
          ),
        ),
      );

      if (state.item != null) {
        add(_FetchRequested(id: state.item!.id));
      }
    });
  }
}
