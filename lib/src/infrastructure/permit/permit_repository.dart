import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/permit/i_permit_repository.dart';
import '../../domain/permit/models/permit_item.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data_sources/permit_remote_data_source.dart';

class PermitRepository implements IPermitRepository {
  final INetworkInfo networkInfo;
  final IPermitRemoteDataSource remoteDataSource;
  PermitRepository({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<GlobalFailure, Paginated<PermitItem>>> getPermits({
    int page = 1,
    int perPage = 10,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getPermits(
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
}
