import 'package:dartz/dartz.dart';

import '../../_commons/global_failure.dart';

class ExternalAuthRedirect {
  final String redirectUrl;
  final String message;
  const ExternalAuthRedirect({
    required this.redirectUrl,
    required this.message,
  });
}

abstract class IExternalAuthRepository {
  Future<Either<GlobalFailure, ExternalAuthRedirect>> google({
    required String deviceToken,
    bool local,
  });

  Future<Either<GlobalFailure, ExternalAuthRedirect>> ldap({
    required String deviceToken,
    bool local,
  });
}
