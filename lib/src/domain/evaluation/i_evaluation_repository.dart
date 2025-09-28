import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import 'models/evaluation.dart' as model;

abstract class IEvaluationRepository {
  Future<Either<GlobalFailure, List<model.EvaluationItem>>>
  getEventEvaluations({required int event});
}
