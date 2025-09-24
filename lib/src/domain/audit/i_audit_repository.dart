import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/audit_item.dart';

abstract class IAuditRepository {
  Future<Either<GlobalFailure, Paginated<AuditItem>>> getAudits({
    int page,
    int perPage,
  });

  Future<Either<GlobalFailure, Paginated<AuditItem>>> getOngoingAudits({
    int page,
    int perPage,
  });

  Future<Either<GlobalFailure, Paginated<AuditItem>>> getUpcomingAudits({
    int page,
    int perPage,
  });

  Future<Either<GlobalFailure, AuditItem>> getAudit({required int id});

  Future<Either<GlobalFailure, String>> changeStatus({
    required int id,
    required String status,
  });
}
