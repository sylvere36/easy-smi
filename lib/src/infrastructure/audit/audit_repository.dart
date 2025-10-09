import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/audit/i_audit_repository.dart';
import '../../domain/audit/models/audit_conclusion.dart';
import '../../domain/audit/models/audit_document_request.dart';
import '../../domain/audit/models/audit_item.dart';
import '../../domain/audit/models/audit_observation.dart';
import '../../domain/audit/models/audit_result.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data_sources/audit_remote_data_source.dart';

class AuditRepository implements IAuditRepository {
  final INetworkInfo networkInfo;
  final IAuditRemoteDataSource remoteDataSource;
  AuditRepository({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<GlobalFailure, Paginated<AuditItem>>> getAudits({
    int page = 1,
    int perPage = 10,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getAudits(
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
  Future<Either<GlobalFailure, Paginated<AuditItem>>> getOngoingAudits({
    int page = 1,
    int perPage = 10,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getOngoingAudits(
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
  Future<Either<GlobalFailure, Paginated<AuditItem>>> getUpcomingAudits({
    int page = 1,
    int perPage = 10,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getUpcomingAudits(
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
  Future<Either<GlobalFailure, AuditItem>> getAudit({required int id}) async {
    if (await networkInfo.checkConnection()) {
      try {
        final item = await remoteDataSource.getAudit(id: id);
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

  @override
  Future<Either<GlobalFailure, String>> changeStatus({
    required int id,
    required String status,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final message = await remoteDataSource.changeStatus(
          id: id,
          status: status,
        );
        return right(message);
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
  Future<Either<GlobalFailure, List<AuditDocumentRequest>>>
  getAuditDocumentRequests({required int id}) async {
    if (await networkInfo.checkConnection()) {
      try {
        final items = await remoteDataSource.getAuditDocumentRequests(id: id);
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

  @override
  Future<Either<GlobalFailure, Paginated<AuditObservation>>>
  getAuditObservations({
    required int id,
    int page = 1,
    int perPage = 10,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getAuditObservations(
          id: id,
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
  Future<Either<GlobalFailure, AuditConclusion>> getAuditConclusion({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final result = await remoteDataSource.getAuditConclusion(id: id);
        return right(result);
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
  Future<Either<GlobalFailure, List<AuditResult>>> getAuditResults({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final result = await remoteDataSource.getAuditResults(id: id);
        return right(result);
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
  Future<Either<GlobalFailure, AuditObservation>> addAuditObservation({
    required int id,
    required String description,
    int? commentaireId,
    required List<String> documents,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final result = await remoteDataSource.addAuditObservation(
          id: id,
          description: description,
          commentaireId: commentaireId,
          documentPaths: documents,
        );
        return right(result);
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
