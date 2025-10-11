import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/finish_course_result.dart';
import 'models/formation_course.dart';
import 'models/formation_detail.dart';
import 'models/formation_item.dart';
import 'models/formation_participant_registration.dart';
import 'models/my_formation.dart';
import 'models/start_course_result.dart';

abstract class IFormationRepository {
  Future<Either<GlobalFailure, Paginated<FormationItem>>> getFormations({
    int page,
    int perPage,
  });

  Future<Either<GlobalFailure, FormationDetail>> getFormation({
    required int id,
  });

  Future<Either<GlobalFailure, List<FormationParticipantRegistration>>>
  getFormationParticipants({required int id});

  Future<Either<GlobalFailure, List<MyFormation>>> getMyFormations();

  Future<Either<GlobalFailure, List<FormationCourse>>> getFormationCourses({
    required int id,
  });

  Future<Either<GlobalFailure, StartCourseResult>> startCourse({
    required int id,
  });

  Future<Either<GlobalFailure, FinishCourseResult>> finishCourse({
    required int id,
  });
}
