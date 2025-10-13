import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/formation/i_formation_repository.dart';
import '../../domain/formation/models/finish_course_result.dart';
import '../../domain/formation/models/finish_formation_result.dart';
import '../../domain/formation/models/formation_course.dart';
import '../../domain/formation/models/formation_detail.dart';
import '../../domain/formation/models/formation_item.dart';
import '../../domain/formation/models/formation_participant_registration.dart';
import '../../domain/formation/models/my_formation.dart';
import '../../domain/formation/models/start_course_result.dart';
import '../../domain/formation/models/user_formations_registrations.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data_sources/formation_remote_data_source.dart';

class FormationRepository implements IFormationRepository {
  final INetworkInfo networkInfo;
  final IFormationRemoteDataSource remoteDataSource;
  FormationRepository({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<GlobalFailure, Paginated<FormationItem>>> getFormations({
    int page = 1,
    int perPage = 10,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getFormations(
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
  Future<Either<GlobalFailure, FormationDetail>> getFormation({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final item = await remoteDataSource.getFormation(id: id);
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
  Future<Either<GlobalFailure, List<FormationParticipantRegistration>>>
  getFormationParticipants({required int id}) async {
    if (await networkInfo.checkConnection()) {
      try {
        final list = await remoteDataSource.getFormationParticipants(id: id);
        return right(list);
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
  Future<Either<GlobalFailure, List<MyFormation>>> getMyFormations() async {
    if (await networkInfo.checkConnection()) {
      try {
        final list = await remoteDataSource.getMyFormations();
        return right(list);
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
  Future<Either<GlobalFailure, List<FormationCourse>>> getFormationCourses({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final list = await remoteDataSource.getFormationCourses(id: id);
        return right(list);
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
  Future<Either<GlobalFailure, StartCourseResult>> startCourse({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final res = await remoteDataSource.startCourse(id: id);
        return right(res);
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
  Future<Either<GlobalFailure, FinishCourseResult>> finishCourse({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final res = await remoteDataSource.finishCourse(id: id);
        return right(res);
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
  Future<Either<GlobalFailure, FinishFormationResult>> finishFormation({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final res = await remoteDataSource.finishFormation(id: id);
        return right(res);
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
  Future<Either<GlobalFailure, UserFormationsRegistrations>>
  getUserFormationsRegistrations() async {
    if (await networkInfo.checkConnection()) {
      try {
        final res = await remoteDataSource.getUserFormationsRegistrations();
        return right(res);
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
  Future<Either<GlobalFailure, Unit>> registerToFormation({
    required Map<String, dynamic> body,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.registerToFormation(body: body);
        return right(unit);
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
