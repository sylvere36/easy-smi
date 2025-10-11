part of 'formation_detail_bloc.dart';

@freezed
abstract class FormationDetailState with _$FormationDetailState {
  const factory FormationDetailState({
    required bool isLoading,
    required FormationDetail? item,
    required Option<Either<GlobalFailure, FormationDetail>> resultOption,
    @Default(false) bool isLoadingParticipants,
    @Default([]) List<FormationParticipantRegistration> participants,
    required Option<
      Either<GlobalFailure, List<FormationParticipantRegistration>>
    >
    participantsResultOption,
    @Default(false) bool isLoadingCourses,
    @Default([]) List<FormationCourse> courses,
    required Option<Either<GlobalFailure, List<FormationCourse>>>
    coursesResultOption,
    @Default(false) bool isStartingCourse,
    required Option<Either<GlobalFailure, StartCourseResult>>
    startCourseResultOption,
    @Default(false) bool isFinishingCourse,
    required Option<Either<GlobalFailure, FinishCourseResult>>
    finishCourseResultOption,
  }) = _FormationDetailState;

  factory FormationDetailState.initial() => FormationDetailState(
    isLoading: false,
    item: null,
    resultOption: none(),
    participantsResultOption: none(),
    coursesResultOption: none(),
    startCourseResultOption: none(),
    finishCourseResultOption: none(),
  );
}
