import 'package:dio/dio.dart';

import '../_commons/network/app_http_service.dart';

class RefreshTokenRepository {
  final Dio _dio;
  RefreshTokenRepository({Dio? dio})
    : _dio = dio ?? AppHttpService.getInstance();

  Future<Map<String, String>> refresh(String refreshToken) async {
    final res = await _dio.post(
      '/auth/refresh-token',
      data: {'refreshToken': refreshToken},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (res.statusCode == 200 || res.statusCode == 201) {
      final data = res.data as Map<String, dynamic>;
      final newAccess = data['accessToken']?.toString();
      final newRefresh = data['refreshToken']?.toString();
      return {
        if (newAccess != null) 'accessToken': newAccess,
        if (newRefresh != null) 'refreshToken': newRefresh,
      };
    }
    throw DioException(
      requestOptions: res.requestOptions,
      response: res,
      error: 'Failed to refresh token',
    );
  }
}
