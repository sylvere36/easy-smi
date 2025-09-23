part of 'authenticated_user_bloc.dart';

@freezed
class AuthenticatedUserEvent with _$AuthenticatedUserEvent {
  const factory AuthenticatedUserEvent.fetchRequested() = _FetchRequested;
  const factory AuthenticatedUserEvent.reset() = _Reset;
  const factory AuthenticatedUserEvent.logoutRequested() = _LogoutRequested;
}
