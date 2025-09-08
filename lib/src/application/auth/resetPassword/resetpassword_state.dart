part of 'resetpassword_bloc.dart';

@freezed
abstract class ResetpasswordState with _$ResetpasswordState {
  const factory ResetpasswordState({
    required String emailAddress,
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool isSubmitable,
    required String clickType,
    required bool emailIsError,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _LoginState;

  factory ResetpasswordState.initial() => ResetpasswordState(
    emailAddress: '',
    showErrorMessages: false,
    isSubmitting: false,
    isSubmitable: false,
    emailIsError: false,
    clickType: '',
    authFailureOrSuccessOption: none(),
  );
}
