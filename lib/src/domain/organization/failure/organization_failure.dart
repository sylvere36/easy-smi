import 'package:freezed_annotation/freezed_annotation.dart';

import '../../_commons/failures.dart';

part 'organization_failure.freezed.dart';

@freezed
abstract class OrganizationFailure with _$OrganizationFailure {
  const factory OrganizationFailure.serverError() = ServerError;
  const factory OrganizationFailure.unauthorized(String errorText) =
      Unauthorized;
  const factory OrganizationFailure.fieldError(String errorText) = FieldError;
  @Implements<NetworkFailure>()
  const factory OrganizationFailure.noNetwork() = NoNetwork;
}
