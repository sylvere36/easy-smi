part of 'notifications_bloc.dart';

@freezed
abstract class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.fetchRequested({
    @Default(1) int page,
    @Default(10) int perPage,
  }) = _FetchRequested;

  const factory NotificationsEvent.refreshRequested() = _RefreshRequested;

  const factory NotificationsEvent.markAsReadRequested({required int id}) =
      _MarkAsReadRequested;
}
