part of 'organization_bloc.dart';

@freezed
abstract class OrganizationState with _$OrganizationState {
  const factory OrganizationState({
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<GlobalFailure, OrganizationSettingsResult>>
    failureOrSuccessOption,
  }) = _OrganizationState;

  factory OrganizationState.initial() => OrganizationState(
    showErrorMessages: false,
    isSubmitting: false,
    failureOrSuccessOption: none(),
  );
}
