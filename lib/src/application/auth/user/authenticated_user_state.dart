part of 'authenticated_user_bloc.dart';

@freezed
abstract class AuthenticatedUserState with _$AuthenticatedUserState {
  const factory AuthenticatedUserState({
    required bool isLoading,
    required AuthenticatedUser? user,
    bool? canLogout,
    required Option<Either<GlobalFailure, AuthenticatedUser>> resultOption,
  }) = _AuthenticatedUserState;

  factory AuthenticatedUserState.initial() => AuthenticatedUserState(
    isLoading: false,
    user: null,
    resultOption: none(),
  );
}
