import 'package:dio/dio.dart';

import '../../_commons/exceptions.dart';
import '../../_commons/network/app_http_service.dart';
import '../../_commons/network/app_requests.dart';

abstract class IExternalAuthRemoteDataSource {
  Future<String> google({required String deviceToken, bool local});
  Future<String> ldap({required String deviceToken, bool local});
}

class ExternalAuthRemoteDataSource implements IExternalAuthRemoteDataSource {
  final IAppRequests httpClient;
  ExternalAuthRemoteDataSource({required this.httpClient});

  @override
  Future<String> google({
    required String deviceToken,
    bool local = true,
  }) async {
    try {
      final String url =
          '${AppHttpService.baseUrl}/auth/google?local=${local ? 1 : 0}&device_token=$deviceToken';
      final Response res = await httpClient.getRequest(url);
      final Map data = res.data as Map;
      final bool success = data['success'] == true;
      if (!success) {
        final String message = data['message']?.toString() ?? 'Server error';
        throw ServerException(message);
      }
      return data['redirectUrl'] as String;
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

  @override
  Future<String> ldap({required String deviceToken, bool local = true}) async {
    try {
      final String url =
          '${AppHttpService.baseUrl}/auth/ldap?local=${local ? 1 : 0}&device_token=$deviceToken';
      final Response res = await httpClient.getRequest(url);
      final Map data = res.data as Map;
      final bool success = data['success'] == true;
      if (!success) {
        final String message = data['message']?.toString() ?? 'Server error';
        throw ServerException(message);
      }
      return data['redirectUrl'] as String;
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
