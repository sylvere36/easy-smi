import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/formation_detail.dart';
import 'models/formation_item.dart';
import 'models/formation_participant_registration.dart';

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
}
