import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/communication/i_communication_repository.dart';
import '../../domain/communication/models/comment.dart';
import '../../domain/communication/models/notification.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import 'data_sources/communication_remote_data_source.dart';

class CommunicationRepository implements ICommunicationRepository {
  final INetworkInfo networkInfo;
  final ICommunicationRemoteDataSource remoteDataSource;
  CommunicationRepository({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<GlobalFailure, List<CommentItem>>> getComments({
    required String commentableType,
    required int commentableId,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final items = await remoteDataSource.getComments(
          commentableType: commentableType,
          commentableId: commentableId,
        );
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
  Future<Either<GlobalFailure, CommentItem>> addComment({
    required String body,
    String? memo,
    required String commentableType,
    required int commentableId,
    String? attachmentPath,
    int? parentId,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final item = await remoteDataSource.addComment(
          body: body,
          memo: memo,
          commentableType: commentableType,
          commentableId: commentableId,
          attachmentPath: attachmentPath,
          parentId: parentId,
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
  Future<Either<GlobalFailure, Unit>> addReaction({
    required int commentId,
    required String reaction,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.addReaction(
          commentId: commentId,
          reaction: reaction,
        );
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

  @override
  Future<Either<GlobalFailure, NotificationPageResult>> getNotifications({
    int page = 1,
    int perPage = 10,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final result = await remoteDataSource.getNotifications(
          page: page,
          perPage: perPage,
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

  @override
  Future<Either<GlobalFailure, Unit>> markNotificationRead({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.markNotificationRead(id: id);
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
