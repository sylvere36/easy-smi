import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/auth/user/authenticated_user.dart';
import '../../domain/auth/user/i_authenticated_user_repository.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import '../_commons/network/user_session.dart';
import 'data_sources/authenticated_user_remote_data_source.dart';

class AuthenticatedUserRepository implements IAuthenticatedUserRepository {
  final INetworkInfo networkInfo;
  final IAuthenticatedUserRemoteDataSource remote;

  AuthenticatedUserRepository({
    required this.networkInfo,
    required this.remote,
  });

  @override
  Future<Either<GlobalFailure, AuthenticatedUser>>
  getAuthenticatedUser() async {
    if (!await networkInfo.checkConnection()) {
      return left(const GlobalFailure.noNetwork());
    }
    try {
      final user = await remote.getAuthenticatedUser();
      await myUserSession.cacheAuthenticatedUser(user);
      return right(user);
    } on UnauthorizedException catch (e) {
      return left(GlobalFailure.unauthorized(e.errorText));
    } on ServerException catch (e) {
      return left(GlobalFailure.serverError(e.errorText));
    } catch (_) {
      return left(const GlobalFailure.serverError(null));
    }
  }
}
