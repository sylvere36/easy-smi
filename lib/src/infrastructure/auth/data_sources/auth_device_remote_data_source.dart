import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/auth/device/device_register_request.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_http_service.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IAuthDeviceRemoteDataSource {
  Future<String> registerDevice({required DeviceRegisterRequest request});
}

class AuthDeviceRemoteDataSource implements IAuthDeviceRemoteDataSource {
  final IAppRequests httpClient;

  AuthDeviceRemoteDataSource({required this.httpClient});

  @override
  Future<String> registerDevice({
    required DeviceRegisterRequest request,
  }) async {
    try {
      final String url = '${AppHttpService.baseUrl}/auth/register-device';
      final body = jsonEncode(request.toJson());
      final Response response = await httpClient.postRequest(url, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = (response.data is String)
            ? json.decode(response.data as String) as Map<String, dynamic>
            : response.data as Map<String, dynamic>;
        final success = data['success'] == true;
        if (!success) {
          throw ServerException(data['message'] as String? ?? 'Unknown error');
        }
        final token = data['device_token'] as String?;
        if (token == null || token.isEmpty) {
          throw ServerException('device_token missing');
        }
        return token;
      }
      throw ServerException(errorThrow(response));
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
