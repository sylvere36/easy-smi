import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/permit/i_permit_repository.dart';
import '../../domain/permit/models/permit_detail.dart';
import '../../domain/permit/models/permit_fire_control.dart';
import '../../domain/permit/models/permit_item.dart';
import '../../domain/permit/models/permit_personnel_assignment.dart';
import '../../domain/permit/models/permit_risk_assessment.dart';
import '../../domain/permit/models/permit_risk_assessment_request.dart';
import '../../domain/permit/models/permit_type_control.dart';
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

  @override
  Future<Either<GlobalFailure, Paginated<PermitRiskAssessment>>>
  getPermitRiskAssessments({
    required int id,
    int page = 1,
    int perPage = 15,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource
            .getPermitRiskAssessments(id: id, page: page, perPage: perPage);
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
  Future<Either<GlobalFailure, PermitRiskAssessment>> setRiskAssessment({
    required int id,
    required int workPermitId,
    required int evaluatorId,
    required List<PermitRiskAssessmentQuestionInput> questions,
    required String status,
    required String conclusion,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final item = await remoteDataSource.setRiskAssessment(
          id: id,
          workPermitId: workPermitId,
          evaluatorId: evaluatorId,
          questions: questions,
          status: status,
          conclusion: conclusion,
        );
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
  Future<Either<GlobalFailure, Paginated<PermitFireControl>>>
  getPermitFireControls({
    required int id,
    int page = 1,
    int perPage = 20,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource
            .getPermitFireControls(id: id, page: page, perPage: perPage);
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
  Future<Either<GlobalFailure, PermitDetail>> getPermit({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final item = await remoteDataSource.getPermit(id: id);
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
  Future<Either<GlobalFailure, Paginated<PermitPersonnelAssignment>>>
  getPermitPersonnel({required int id, int page = 1, int perPage = 20}) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getPermitPersonnel(
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
  Future<Either<GlobalFailure, Paginated<PermitTypeControl>>>
  getPermitTypeControls({
    required int id,
    int page = 1,
    int perPage = 20,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource
            .getPermitTypeControls(id: id, page: page, perPage: perPage);
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
