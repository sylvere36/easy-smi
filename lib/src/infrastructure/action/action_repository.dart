import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/action/i_action_repository.dart';
import '../../domain/action/models/action_item.dart';
import '../../domain/action/models/action_task.dart';
import '../_commons/exceptions.dart';
import '../_commons/files/download_service.dart';
import '../_commons/network/network_info.dart';
import 'data_sources/action_remote_data_source.dart';

class ActionRepository implements IActionRepository {
  final INetworkInfo networkInfo;
  final IActionRemoteDataSource remoteDataSource;
  final IDownloadService downloadService;
  ActionRepository({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.downloadService,
  });

  @override
  Future<Either<GlobalFailure, List<ActionItem>>> getActions() async {
    if (await networkInfo.checkConnection()) {
      try {
        final items = await remoteDataSource.getActions();
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
  Future<Either<GlobalFailure, List<ActionItem>>> getActionsByOrigin({
    required String originType,
    required int originId,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final items = await remoteDataSource.getActionsByOrigin(
          originType: originType,
          originId: originId,
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
  Future<Either<GlobalFailure, ActionItem>> getAction({required int id}) async {
    if (await networkInfo.checkConnection()) {
      try {
        final item = await remoteDataSource.getAction(id: id);
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
  Future<Either<GlobalFailure, String>> requestValidation({
    required int id,
    String? comment,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final message = await remoteDataSource.requestValidation(
          id: id,
          comment: comment,
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
  Future<Either<GlobalFailure, String>> requestRevision({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final message = await remoteDataSource.requestRevision(id: id);
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
  Future<Either<GlobalFailure, String>> submitRevision({
    required int id,
    String? revisionComment,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final message = await remoteDataSource.submitRevision(
          id: id,
          revisionComment: revisionComment,
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
  Future<Either<GlobalFailure, String>> printActionDocument({
    required int id,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final response = await remoteDataSource.downloadActionDocument(id: id);
        final contentDisposition = response.headers.value(
          'content-disposition',
        );
        String filename = 'action_$id.pdf';
        if (contentDisposition != null && contentDisposition.isNotEmpty) {
          final match = RegExp(
            r'filename="?([^";]+)"?',
          ).firstMatch(contentDisposition);
          if (match != null) {
            filename = match.group(1) ?? filename;
          }
        }
        final bytes = response.data ?? <int>[];
        final savedPath = await downloadService.saveBytesToFile(
          bytes: bytes,
          filename: filename,
          subdir: 'actions',
        );
        return right(savedPath);
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
  Future<Either<GlobalFailure, List<ActionTask>>> getTasks({
    required int actionId,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final items = await remoteDataSource.getTasks(id: actionId);
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
