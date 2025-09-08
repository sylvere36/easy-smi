import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_failure.freezed.dart';

@freezed
abstract class GlobalFailure with _$GlobalFailure {
  const factory GlobalFailure.serverError(String? errorText) = ServerError;
  const factory GlobalFailure.unauthorized(String errorText) = Unauthorized;
  const factory GlobalFailure.noNetwork() = NoNetwork;
}

extension GlobalFailureX on GlobalFailure {
  T customMap<T>({
    required T Function(ServerError) serverError,
    required T Function(Unauthorized) unauthorized,
    required T Function(NoNetwork) noNetwork,
  }) {
    if (this is ServerError) {
      return serverError(this as ServerError);
    } else if (this is Unauthorized) {
      return unauthorized(this as Unauthorized);
    } else if (this is NoNetwork) {
      return noNetwork(this as NoNetwork);
    }
    throw Exception('Unhandled GlobalFailure type: $this');
  }
}
