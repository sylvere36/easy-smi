part of 'resetpassword_bloc.dart';

@freezed
class ResetpasswordEvent with _$ResetpasswordEvent {
  const factory ResetpasswordEvent.started() = _Started;
  const factory ResetpasswordEvent.click(String buttonType) = Click;
  const factory ResetpasswordEvent.emailChanged(String value) = EmailChanged;
  const factory ResetpasswordEvent.submit() = Submit;
}
