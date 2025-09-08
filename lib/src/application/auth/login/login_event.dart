part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.click(String buttonType) = Click;
  const factory LoginEvent.emailChanged(String value) = EmailChanged;
  const factory LoginEvent.passwordChanged(String value) = PasswordChanged;
  const factory LoginEvent.submit() = Submit;
}
