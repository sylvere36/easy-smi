part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required String emailAddress,
    required String password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool isSubmitable,
    required String clickType,
    required bool emailIsError,
    required bool passwordIsError,
    required bool? restartApp,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
    emailAddress: '',
    password: '',
    showErrorMessages: false,
    isSubmitting: false,
    isSubmitable: false,
    emailIsError: false,
    passwordIsError: false,
    restartApp: null,
    clickType: '',
    authFailureOrSuccessOption: none(),
  );
}
