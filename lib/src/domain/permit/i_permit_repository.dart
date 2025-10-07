import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/permit_item.dart';
import 'models/permit_detail.dart';
import 'models/permit_personnel_assignment.dart';
import 'models/permit_type_control.dart';
import 'models/permit_fire_control.dart';
import 'models/permit_risk_assessment.dart';

abstract class IPermitRepository {
  Future<Either<GlobalFailure, Paginated<PermitItem>>> getPermits({
    int page,
    int perPage,
  });

  Future<Either<GlobalFailure, PermitDetail>> getPermit({required int id});

  Future<Either<GlobalFailure, Paginated<PermitPersonnelAssignment>>>
  getPermitPersonnel({required int id, int page, int perPage});

  Future<Either<GlobalFailure, Paginated<PermitTypeControl>>>
  getPermitTypeControls({required int id, int page, int perPage});

  Future<Either<GlobalFailure, Paginated<PermitFireControl>>>
  getPermitFireControls({required int id, int page, int perPage});

  Future<Either<GlobalFailure, Paginated<PermitRiskAssessment>>>
  getPermitRiskAssessments({required int id, int page, int perPage});
}
