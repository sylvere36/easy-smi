part of 'organization_bloc.dart';

@freezed
abstract class OrganizationEvent with _$OrganizationEvent {
  const factory OrganizationEvent.fetch(String email) = _Fetch;
}
