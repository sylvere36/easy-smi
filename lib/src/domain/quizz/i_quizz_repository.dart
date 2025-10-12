import 'package:dartz/dartz.dart';
import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/quizz_item.dart';
import 'models/quizz_submission.dart';

abstract class IQuizzRepository {
  Future<Either<GlobalFailure, Paginated<QuizzItem>>> getQuizzes({
    int page,
    int perPage,
  });

  Future<Either<GlobalFailure, QuizzItem>> getQuizzDetail({required int id});

  Future<Either<GlobalFailure, QuizzSubmissionResult>> submitQuizzAnswers({
    required QuizzSubmissionRequest request,
  });
}
