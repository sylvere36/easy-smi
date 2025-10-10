import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/communication/i_communication_repository.dart';
import '../../domain/communication/models/notification.dart';

part 'notifications_bloc.freezed.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final ICommunicationRepository repository;
  NotificationsBloc({required this.repository})
    : super(NotificationsState.initial()) {
    on<_FetchRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, resultOption: none()));
      final res = await repository.getNotifications(
        page: event.page,
        perPage: event.perPage,
      );
      emit(
        res.fold(
          (l) => state.copyWith(isLoading: false, resultOption: some(left(l))),
          (data) => state.copyWith(
            isLoading: false,
            items: data.items,
            total: data.total,
            perPage: data.perPage,
            currentPage: data.currentPage,
            lastPage: data.lastPage,
            unreadCount: data.unreadCount,
            resultOption: some(right(data)),
          ),
        ),
      );
    });

    on<_RefreshRequested>((event, emit) async {
      if (state.isLoading) return;
      add(NotificationsEvent.fetchRequested(perPage: state.perPage));
    });

    on<_MarkAsReadRequested>((event, emit) async {
      if (state.isMarking) return;
      emit(state.copyWith(isMarking: true, markResultOption: none()));
      // Optimistic update: set item read locally
      final idx = state.items.indexWhere((e) => e.id == event.id);
      final originalItems = state.items;
      if (idx != -1 && state.items[idx].isUnread) {
        final updated = List<NotificationItem>.from(state.items);
        final item = updated[idx];
        updated[idx] = NotificationItem(
          id: item.id,
          object: item.object,
          htmlContent: item.htmlContent,
          type: item.type,
          readByRecipient: 1,
          isPriority: item.isPriority,
          scheduledAt: item.scheduledAt,
          senderName: item.senderName,
          createdAt: item.createdAt,
        );
        emit(
          state.copyWith(
            items: updated,
            unreadCount: (state.unreadCount > 0) ? state.unreadCount - 1 : 0,
          ),
        );
      }
      final res = await repository.markNotificationRead(id: event.id);
      emit(
        res.fold(
          (l) {
            // rollback
            emit(state.copyWith(items: originalItems));
            return state.copyWith(
              isMarking: false,
              markResultOption: some(left(l)),
            );
          },
          (_) {
            // success; optionally refresh to get latest
            add(const NotificationsEvent.refreshRequested());
            return state.copyWith(
              isMarking: false,
              markResultOption: some(right(unit)),
            );
          },
        ),
      );
    });
  }
}
