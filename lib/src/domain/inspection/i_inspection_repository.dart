import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/inspection_answers_post.dart';
import 'models/inspection_detail.dart';
import 'models/inspection_item.dart';

abstract class IInspectionRepository {
  Future<Either<GlobalFailure, Paginated<InspectionItem>>> getInspections({
    int page,
    int perPage,
  });

  Future<Either<GlobalFailure, InspectionDetail>> getInspection({
    required int id,
  });

  Future<Either<GlobalFailure, List<InspectionSectionWithQuestions>>>
  getInspectionFormSections({required int inspectionFormId});

  Future<Either<GlobalFailure, InspectionDetail>> postInspectionAnswers({
    required int inspectionId,
    required InspectionAnswersPostBody body,
  });
}
