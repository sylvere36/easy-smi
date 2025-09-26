import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/communication/i_communication_repository.dart';
import '../../domain/communication/models/comment.dart';

part 'comments_bloc.freezed.dart';
part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final ICommunicationRepository repository;
  CommentsBloc({required this.repository}) : super(CommentsState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(
        state.copyWith(isLoading: true, resultOption: none(), items: const []),
      );
      final res = await repository.getComments(
        commentableType: event.commentableType,
        commentableId: event.commentableId,
      );
      emit(
        res.fold(
          (l) => state.copyWith(isLoading: false, resultOption: some(left(l))),
          (items) => state.copyWith(
            isLoading: false,
            items: items,
            resultOption: some(right(items)),
          ),
        ),
      );
    });
    on<_RefreshRequested>((event, emit) async {
      if (state.isLoading) return; // avoid duplicate refresh
      add(
        CommentsEvent.fetchRequested(
          commentableType: event.commentableType,
          commentableId: event.commentableId,
        ),
      );
    });

    on<_AddCommentRequested>((event, emit) async {
      if (state.isSubmitting) return; // prevent double submit
      emit(state.copyWith(isSubmitting: true, submitResultOption: none()));
      final res = await repository.addComment(
        body: event.body,
        memo: event.memo,
        commentableType: event.commentableType,
        commentableId: event.commentableId,
        attachmentPath: event.attachmentPath,
        parentId: event.parentId,
      );
      emit(
        res.fold(
          (l) => state.copyWith(
            isSubmitting: false,
            submitResultOption: some(left(l)),
          ),
          (comment) => state.copyWith(
            isSubmitting: false,
            // If it's a reply (parentId not null), insert into parent's children; else prepend to list.
            items: _insertNewComment(state.items, comment, event.parentId),
            submitResultOption: some(right(comment)),
          ),
        ),
      );
    });

    on<_AddReactionRequested>((event, emit) async {
      if (state.isReacting) return;
      emit(state.copyWith(isReacting: true, reactionResultOption: none()));
      // Optimistic update: adjust local counts
      final idx = state.items.indexWhere((c) => c.id == event.commentId);
      final List<CommentItem> originalItems = state.items;
      List<CommentItem> updatedItems = state.items;
      if (idx != -1) {
        final target = state.items[idx];
        // Compute new reaction counts (simple increment for selected reaction)
        final currentCounts = target.reactionCounts;
        int like = currentCounts.like;
        int good = currentCounts.good;
        int love = currentCounts.love;
        int bad = currentCounts.bad;
        switch (event.reaction) {
          case 'like':
            like += 1;
            break;
          case 'good':
            good += 1;
            break;
          case 'love':
            love += 1;
            break;
          case 'bad':
            bad += 1;
            break;
        }
        final newCounts = CommentReactionCounts(
          like: like,
          good: good,
          love: love,
          bad: bad,
        );
        final newMyReaction = CommentReactionCounts(
          like: event.reaction == 'like' ? 1 : target.myReaction.like,
          good: event.reaction == 'good' ? 1 : target.myReaction.good,
          love: event.reaction == 'love' ? 1 : target.myReaction.love,
          bad: event.reaction == 'bad' ? 1 : target.myReaction.bad,
        );
        final updated = CommentItem(
          id: target.id,
          userId: target.userId,
          body: target.body,
          memo: target.memo,
          attachmentPath: target.attachmentPath,
          organizationId: target.organizationId,
          commentableType: target.commentableType,
          commentableId: target.commentableId,
          parentId: target.parentId,
          createdAt: target.createdAt,
          updatedAt: target.updatedAt,
          userName: target.userName,
          readsCount: target.readsCount,
          reactionCounts: newCounts,
          myReaction: newMyReaction,
          children: target.children,
          attachmentUrl: target.attachmentUrl,
          reads: target.reads,
        );
        updatedItems = List<CommentItem>.from(state.items);
        updatedItems[idx] = updated;
        emit(state.copyWith(items: updatedItems));
      }
      final res = await repository.addReaction(
        commentId: event.commentId,
        reaction: event.reaction,
      );
      emit(
        res.fold(
          (l) {
            // rollback optimistic update if failed
            if (idx != -1) {
              emit(state.copyWith(items: originalItems));
            }
            return state.copyWith(
              isReacting: false,
              reactionResultOption: some(left(l)),
            );
          },
          (_) => state.copyWith(
            isReacting: false,
            reactionResultOption: some(right(unit)),
          ),
        ),
      );
    });
  }
}

List<CommentItem> _insertNewComment(
  List<CommentItem> current,
  CommentItem newComment,
  int? parentId,
) {
  if (parentId == null) {
    return [newComment, ...current]; // prepend new root comment
  }

  List<CommentItem> recurse(List<CommentItem> items) {
    return items.map((item) {
      if (item.id == parentId) {
        // append new comment to this parent's children (could also prepend)
        final updatedChildren = [newComment, ...item.children];
        return CommentItem(
          id: item.id,
          userId: item.userId,
          body: item.body,
          memo: item.memo,
          attachmentPath: item.attachmentPath,
          organizationId: item.organizationId,
          commentableType: item.commentableType,
          commentableId: item.commentableId,
          parentId: item.parentId,
          createdAt: item.createdAt,
          updatedAt: item.updatedAt,
          userName: item.userName,
          readsCount: item.readsCount,
          reactionCounts: item.reactionCounts,
          myReaction: item.myReaction,
          children: updatedChildren,
          attachmentUrl: item.attachmentUrl,
          reads: item.reads,
        );
      }
      if (item.children.isNotEmpty) {
        final updatedKids = recurse(item.children);
        if (!identical(updatedKids, item.children)) {
          return CommentItem(
            id: item.id,
            userId: item.userId,
            body: item.body,
            memo: item.memo,
            attachmentPath: item.attachmentPath,
            organizationId: item.organizationId,
            commentableType: item.commentableType,
            commentableId: item.commentableId,
            parentId: item.parentId,
            createdAt: item.createdAt,
            updatedAt: item.updatedAt,
            userName: item.userName,
            readsCount: item.readsCount,
            reactionCounts: item.reactionCounts,
            myReaction: item.myReaction,
            children: updatedKids,
            attachmentUrl: item.attachmentUrl,
            reads: item.reads,
          );
        }
      }
      return item;
    }).toList();
  }

  final updated = recurse(current);
  return updated;
}
