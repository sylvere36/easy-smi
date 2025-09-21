import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/auth/external/i_external_auth_repository.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import '../auth/data_sources/external_auth_remote_data_source.dart';

class ExternalAuthRepository implements IExternalAuthRepository {
  final INetworkInfo networkInfo;
  final IExternalAuthRemoteDataSource remote;
  ExternalAuthRepository({required this.networkInfo, required this.remote});

  @override
  Future<Either<GlobalFailure, ExternalAuthRedirect>> google({
    required String deviceToken,
    bool local = true,
  }) async {
    if (!await networkInfo.checkConnection()) {
      return left(const GlobalFailure.noNetwork());
    }
    try {
      final url = await remote.google(deviceToken: deviceToken, local: local);
      return right(
        ExternalAuthRedirect(redirectUrl: url, message: ''),
      ); // message optional
    } on UnauthorizedException catch (e) {
      return left(GlobalFailure.unauthorized(e.errorText));
    } on ServerException catch (e) {
      return left(GlobalFailure.serverError(e.errorText));
    } catch (_) {
      return left(const GlobalFailure.serverError(null));
    }
  }

  @override
  Future<Either<GlobalFailure, ExternalAuthRedirect>> ldap({
    required String deviceToken,
    bool local = true,
  }) async {
    if (!await networkInfo.checkConnection()) {
      return left(const GlobalFailure.noNetwork());
    }
    try {
      final url = await remote.ldap(deviceToken: deviceToken, local: local);
      return right(ExternalAuthRedirect(redirectUrl: url, message: ''));
    } on UnauthorizedException catch (e) {
      return left(GlobalFailure.unauthorized(e.errorText));
    } on ServerException catch (e) {
      return left(GlobalFailure.serverError(e.errorText));
    } catch (_) {
      return left(const GlobalFailure.serverError(null));
    }
  }
}
