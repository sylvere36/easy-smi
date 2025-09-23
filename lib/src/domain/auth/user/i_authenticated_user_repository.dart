import 'package:dartz/dartz.dart';

import '../../_commons/global_failure.dart';
import 'authenticated_user.dart';

abstract class IAuthenticatedUserRepository {
  Future<Either<GlobalFailure, AuthenticatedUser>> getAuthenticatedUser();
}
