part of 'notifications_bloc.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default([]) List<NotificationItem> items,
    @Default(0) int total,
    @Default(10) int perPage,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(0) int unreadCount,
    @Default(false) bool isLoading,
    @Default(false) bool isMarking,
    required Option<Either<GlobalFailure, NotificationPageResult>> resultOption,
    required Option<Either<GlobalFailure, Unit>> markResultOption,
  }) = _NotificationsState;

  factory NotificationsState.initial() =>
      NotificationsState(resultOption: none(), markResultOption: none());
}
