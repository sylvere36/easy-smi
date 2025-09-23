part of 'organization_bloc.dart';

@freezed
abstract class OrganizationEvent with _$OrganizationEvent {
  const factory OrganizationEvent.fetch(String email) = _Fetch;
  // Trigger a join-organization request (admin email pulled from session)
  const factory OrganizationEvent.joinRequested() = _JoinRequested;
}
