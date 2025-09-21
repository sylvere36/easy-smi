part of 'external_auth_bloc.dart';

@freezed
class ExternalAuthEvent with _$ExternalAuthEvent {
  const factory ExternalAuthEvent.googlePressed() = _GooglePressed;
  const factory ExternalAuthEvent.ldapPressed() = _LdapPressed;
  const factory ExternalAuthEvent.reset() = _Reset;
}
