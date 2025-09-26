part of 'comments_bloc.dart';

@freezed
abstract class CommentsEvent with _$CommentsEvent {
  const factory CommentsEvent.fetchRequested({
    required String commentableType,
    required int commentableId,
  }) = _FetchRequested;

  const factory CommentsEvent.refreshRequested({
    required String commentableType,
    required int commentableId,
  }) = _RefreshRequested;

  const factory CommentsEvent.addCommentRequested({
    required String body,
    String? memo,
    required String commentableType,
    required int commentableId,
    String? attachmentPath,
    int? parentId,
  }) = _AddCommentRequested;

  const factory CommentsEvent.addReactionRequested({
    required int commentId,
    required String reaction,
  }) = _AddReactionRequested;
}
