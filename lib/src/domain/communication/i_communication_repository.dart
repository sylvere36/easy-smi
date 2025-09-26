import 'package:dartz/dartz.dart';

import '../_commons/global_failure.dart';
import 'models/comment.dart';

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
}
