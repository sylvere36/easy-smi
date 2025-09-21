part of 'external_auth_bloc.dart';

@freezed
abstract class ExternalAuthState with _$ExternalAuthState {
  const factory ExternalAuthState({
    required bool isSubmitting,
    required Option<Either<GlobalFailure, String>> resultOption,
  }) = _ExternalAuthState;

  factory ExternalAuthState.initial() =>
      ExternalAuthState(isSubmitting: false, resultOption: none());
}
