import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/evaluation/i_evaluation_repository.dart';
import '../../domain/evaluation/models/evaluation.dart' as model;
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data-source/evaluation_remote_data_source.dart';

class EvaluationRepository implements IEvaluationRepository {
  final INetworkInfo networkInfo;
  final IEvaluationRemoteDataSource remoteDataSource;

  EvaluationRepository({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<GlobalFailure, List<model.EvaluationItem>>>
  getEventEvaluations({required int event}) async {
    if (await networkInfo.checkConnection()) {
      try {
        final items = await remoteDataSource.getEventEvaluations(event: event);
        return right(items);
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
