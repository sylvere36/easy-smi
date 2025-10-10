import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import 'models/comment.dart';
import 'models/notification.dart';

abstract class ICommunicationRepository {
  Future<Either<GlobalFailure, List<CommentItem>>> getComments({
    required String commentableType,
    required int commentableId,
  });

  Future<Either<GlobalFailure, CommentItem>> addComment({
    required String body,
    String? memo,
    required String commentableType,
    required int commentableId,
    String? attachmentPath, // local file path for upload
    int? parentId,
  });

  Future<Either<GlobalFailure, Unit>> addReaction({
    required int commentId,
    required String reaction, // like | good | love | bad
  });

  // Notifications
  Future<Either<GlobalFailure, NotificationPageResult>> getNotifications({
    int page = 1,
    int perPage = 10,
  });

  Future<Either<GlobalFailure, Unit>> markNotificationRead({required int id});
}
