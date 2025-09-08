part of 'register_bloc.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    required UserCreate? userCreate,
    required String fieldKey,
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool isSubmitable,
    required String? errorMessage,
    required String clickType,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _RegisterState;

  factory RegisterState.initial() => RegisterState(
    userCreate: null,
    fieldKey: '',
    showErrorMessages: false,
    errorMessage: null,
    isSubmitting: false,
    isSubmitable: false,
    clickType: '',
    authFailureOrSuccessOption: none(),
  );
}
