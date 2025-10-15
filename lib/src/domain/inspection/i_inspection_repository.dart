import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/inspection_answers_post.dart';
import 'models/inspection_detail.dart';
import 'models/inspection_form_detail.dart';
import 'models/inspection_form_available_item.dart';
import 'models/inspection_form_item.dart';
import 'models/inspection_item.dart';

abstract class IInspectionRepository {
  Future<Either<GlobalFailure, Paginated<InspectionItem>>> getInspections({
    int page,
    int perPage,
  });

  Future<Either<GlobalFailure, InspectionDetail>> getInspection({
    required int id,
  });

  Future<Either<GlobalFailure, List<InspectionFormItem>>> getInspectionForms();

  Future<Either<GlobalFailure, List<InspectionFormAvailableItem>>>
  getInspectionFormsAvailable();

  Future<Either<GlobalFailure, InspectionFormDetail>> getInspectionFormDetail({
    required int id,
  });

  Future<Either<GlobalFailure, List<InspectionSectionWithQuestions>>>
  getInspectionFormSections({required int inspectionFormId});

  Future<Either<GlobalFailure, List<InspectionSectionWithQuestions>>>
  getInspectionFormStructure({required int id});

  Future<Either<GlobalFailure, InspectionDetail>> postInspectionAnswers({
    required int inspectionId,
    required InspectionAnswersPostBody body,
  });

  Future<Either<GlobalFailure, InspectionDetail>> postInspectionRemarks({
    required int inspectionId,
    required String otherRemark,
    required String recommendation,
  });
}
