import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/organization/i_organization_repository.dart';
import '../../../domain/organization/models/license.dart';
import '../../../domain/organization/models/organization_settings.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IOrganizationRemoteDataSource {
  Future<OrganizationSettingsResult> getOrganizationSettings({
    required String email,
  });
}

class OrganizationRemoteDataSource implements IOrganizationRemoteDataSource {
  final IAppRequests httpClient;
  OrganizationRemoteDataSource({required this.httpClient});

  @override
  Future<OrganizationSettingsResult> getOrganizationSettings({
    required String email,
  }) async {
    final String request = 'licence/get-organization-settings';
    final body = jsonEncode({'email': email});
    final Response response = await httpClient.postRequest(request, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = (response.data is String)
          ? json.decode(response.data as String) as Map<String, dynamic>
          : (response.data as Map<String, dynamic>);
      final bool success = data['success'] == true;
      final String message = (data['message'] as String?) ?? '';
      if (!success) {
        throw ServerException(message);
      }
      final OrganizationSettings settings = OrganizationSettings.fromJson(
        data['settings'] as Map<String, dynamic>,
      );
      final OrganizationLicense license = OrganizationLicense.fromJson(
        data['license'] as Map<String, dynamic>,
      );
      return OrganizationSettingsResult(
        settings: settings,
        license: license,
        message: message,
      );
    } else {
      throw ServerException(errorThrow(response));
    }
  }
}
