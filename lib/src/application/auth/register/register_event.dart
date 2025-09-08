part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.click(String buttonType) = Click;
  const factory RegisterEvent.fieldChanged(String fieldKey, String? value) =
      FieldChanged;
  const factory RegisterEvent.submit(bool conditionCheck) = Submit;
}
