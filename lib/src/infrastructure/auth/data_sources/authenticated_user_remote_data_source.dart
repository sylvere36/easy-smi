import 'package:dio/dio.dart';

import '../../../domain/auth/user/authenticated_user.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_http_service.dart';
import '../../_commons/network/app_requests.dart';

abstract class IAuthenticatedUserRemoteDataSource {
  Future<AuthenticatedUser> getAuthenticatedUser();
}

class AuthenticatedUserRemoteDataSource
    implements IAuthenticatedUserRemoteDataSource {
  final IAppRequests httpClient;
  AuthenticatedUserRemoteDataSource({required this.httpClient});

  @override
  Future<AuthenticatedUser> getAuthenticatedUser() async {
    try {
      final String url = '${AppHttpService.baseUrl}/auth/user';
      final Response res = await httpClient.getRequest(url);
      final Map data = res.data as Map;
      final Map? raw = data['authenticated_user'] as Map?;
      if (raw == null) {
        throw ServerException('Malformed server response');
      }
      return AuthenticatedUser(
        id: raw['id'] as int,
        name: raw['name']?.toString() ?? '',
        email: raw['email']?.toString() ?? '',
        organizationValidated:
            raw['organization_validated'] == 1 ||
            raw['organization_validated'] == true,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException(
          e.response?.data is Map
              ? (e.response?.data['message']?.toString() ?? 'Unauthorized')
              : 'Unauthorized',
        );
      }
      final String msg = e.response?.data is Map
          ? (e.response?.data['message']?.toString() ?? 'Server error')
          : 'Server error';
      throw ServerException(msg);
    }
  }
}
