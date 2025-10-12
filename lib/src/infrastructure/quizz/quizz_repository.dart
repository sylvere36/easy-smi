import 'package:dartz/dartz.dart';
import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/quizz/i_quizz_repository.dart';
import '../../domain/quizz/models/quizz_item.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data_sources/quizz_remote_data_source.dart';

class QuizzRepository implements IQuizzRepository {
  final INetworkInfo networkInfo;
  final IQuizzRemoteDataSource remoteDataSource;
  QuizzRepository({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<GlobalFailure, Paginated<QuizzItem>>> getQuizzes({
    int page = 1,
    int perPage = 10,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getQuizzes(
          page: page,
          perPage: perPage,
        );
        return right(Paginated(items: items, pagination: pagination));
      } on UnauthorizedException catch (e) {
        return left(GlobalFailure.unauthorized(e.errorText));
      } on ServerException catch (e) {
        if (e.errorText.isNotEmpty) {
          return left(GlobalFailure.serverError(e.errorText));
        }
        return left(const GlobalFailure.serverError(null));
      }
    }
    return left(const GlobalFailure.noNetwork());
  }

  @override
  Future<Either<GlobalFailure, QuizzItem>> getQuizzDetail({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final item = await remoteDataSource.getQuizzDetail(id: id);
        return right(item);
      } on UnauthorizedException catch (e) {
        return left(GlobalFailure.unauthorized(e.errorText));
      } on ServerException catch (e) {
        if (e.errorText.isNotEmpty) {
          return left(GlobalFailure.serverError(e.errorText));
        }
        return left(const GlobalFailure.serverError(null));
      }
    }
    return left(const GlobalFailure.noNetwork());
  }
}
