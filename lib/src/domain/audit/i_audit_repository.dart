import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import '../_commons/pagination.dart';
import 'models/audit_conclusion.dart';
import 'models/audit_document_request.dart';
import 'models/audit_item.dart';
import 'models/audit_observation.dart';
import 'models/audit_result.dart';

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

  Future<Either<GlobalFailure, List<AuditDocumentRequest>>>
  getAuditDocumentRequests({required int id});

  /// Observations list for a given audit (paginated)
  Future<Either<GlobalFailure, Paginated<AuditObservation>>>
  getAuditObservations({required int id, int page, int perPage});

  Future<Either<GlobalFailure, AuditConclusion>> getAuditConclusion({
    required int id,
  });

  Future<Either<GlobalFailure, List<AuditResult>>> getAuditResults({
    required int id,
  });

  Future<Either<GlobalFailure, AuditObservation>> addAuditObservation({
    required int id,
    required String description,
    int? commentaireId,
    required List<String> documents,
  });
}
