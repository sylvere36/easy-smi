import 'package:dartz/dartz.dart';

import '../../domain/_commons/global_failure.dart';
import '../../domain/organization/i_organization_repository.dart';
import '../../domain/organization/models/organization_user.dart';
import '../_commons/exceptions.dart';
import '../_commons/network/network_info.dart';
import '../_commons/network/user_session.dart';
import 'data_sources/organization_remote_data_source.dart';

class OrganizationRepository implements IOrganizationRepository {
  final INetworkInfo networkInfo;
  final IOrganizationRemoteDataSource remoteDataSource;
  OrganizationRepository({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<GlobalFailure, OrganizationSettingsResult>>
  getOrganizationSettings({required String email}) async {
    if (await networkInfo.checkConnection()) {
      try {
        final result = await remoteDataSource.getOrganizationSettings(
          email: email,
        );
        return right(result);
      } on UnauthorizedException catch (e) {
        return left(GlobalFailure.unauthorized(e.errorText));
      } on ServerException catch (e) {
        // When backend returns success=false with message
        if (e.errorText.isNotEmpty) {
          return left(GlobalFailure.serverError(e.errorText));
        }
        return left(const GlobalFailure.serverError(null));
      }
    }
    return left(const GlobalFailure.noNetwork());
  }

  @override
  Future<Either<GlobalFailure, String>> joinOrganization() async {
    if (await networkInfo.checkConnection()) {
      try {
        // Get admin email from cached organization settings

        final settings = await myUserSession.getOrganizationSettings();
        final adminEmail = settings?.adminEmail ?? '';

        if (adminEmail.isEmpty) {
          return left(
            const GlobalFailure.serverError(
              'Admin email not found in organization settings',
            ),
          );
        }
        final message = await remoteDataSource.joinOrganization(
          adminEmail: adminEmail,
        );
        return right(message);
      } on UnauthorizedException catch (e) {
        return left(GlobalFailure.unauthorized(e.errorText));
      } on ServerException catch (e) {
        if (e.errorText.isNotEmpty) {
          return left(GlobalFailure.serverError(e.errorText));
        }
        return left(const GlobalFailure.serverError(null));
      }
    }
    return left(const GlobalFailure.noNetwork());
  }

  @override
  Future<Either<GlobalFailure, List<OrganizationUser>>>
  getOrganizationUsers() async {
    if (await networkInfo.checkConnection()) {
      try {
        final items = await remoteDataSource.getOrganizationUsers();
        return right(items);
      } on UnauthorizedException catch (e) {
        return left(GlobalFailure.unauthorized(e.errorText));
      } on ServerException catch (e) {
        if (e.errorText.isNotEmpty) {
          return left(GlobalFailure.serverError(e.errorText));
        }
        return left(const GlobalFailure.serverError(null));
      }
    }
    return left(const GlobalFailure.noNetwork());
  }
}
