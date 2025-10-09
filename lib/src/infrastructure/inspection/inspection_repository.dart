import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/_commons/pagination.dart';
import '../../domain/inspection/i_inspection_repository.dart';
import '../../domain/inspection/models/inspection_answers_post.dart';
import '../../domain/inspection/models/inspection_detail.dart';
import '../../domain/inspection/models/inspection_form_detail.dart';
import '../../domain/inspection/models/inspection_form_item.dart';
import '../../domain/inspection/models/inspection_item.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data_sources/inspection_remote_data_source.dart';

class InspectionRepository implements IInspectionRepository {
  final INetworkInfo networkInfo;
  final IInspectionRemoteDataSource remoteDataSource;
  InspectionRepository({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<GlobalFailure, Paginated<InspectionItem>>> getInspections({
    int page = 1,
    int perPage = 5,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final (items, pagination) = await remoteDataSource.getInspections(
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
  Future<Either<GlobalFailure, InspectionDetail>> getInspection({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final item = await remoteDataSource.getInspection(id: id);
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
  Future<Either<GlobalFailure, List<InspectionFormItem>>>
  getInspectionForms() async {
    if (await networkInfo.checkConnection()) {
      try {
        final items = await remoteDataSource.getInspectionForms();
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
  Future<Either<GlobalFailure, List<InspectionSectionWithQuestions>>>
  getInspectionFormSections({required int inspectionFormId}) async {
    if (await networkInfo.checkConnection()) {
      try {
        final sections = await remoteDataSource.getInspectionFormSections(
          inspectionFormId: inspectionFormId,
        );
        return right(sections);
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
  Future<Either<GlobalFailure, InspectionFormDetail>> getInspectionFormDetail({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final item = await remoteDataSource.getInspectionFormDetail(id: id);
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
  Future<Either<GlobalFailure, InspectionDetail>> postInspectionAnswers({
    required int inspectionId,
    required InspectionAnswersPostBody body,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final updated = await remoteDataSource.postInspectionAnswers(
          inspectionId: inspectionId,
          body: body,
        );
        return right(updated);
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
