import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/permit_item.dart';

abstract class IPermitRepository {
  Future<Either<GlobalFailure, Paginated<PermitItem>>> getPermits({
    int page,
    int perPage,
  });
}
