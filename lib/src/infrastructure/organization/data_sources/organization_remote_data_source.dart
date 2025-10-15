import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/organization/i_organization_repository.dart';
import '../../../domain/organization/models/license.dart';
import '../../../domain/organization/models/organization_settings.dart';
import '../../../domain/organization/models/organization_user.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IOrganizationRemoteDataSource {
  Future<OrganizationSettingsResult> getOrganizationSettings({
    required String email,
  });

  Future<String> joinOrganization({required String adminEmail});

  Future<List<OrganizationUser>> getOrganizationUsers();
}

class OrganizationRemoteDataSource implements IOrganizationRemoteDataSource {
  final IAppRequests httpClient;
  OrganizationRemoteDataSource({required this.httpClient});

  @override
  Future<OrganizationSettingsResult> getOrganizationSettings({
    required String email,
  }) async {
    try {
      final String request = '/licence/get-organization-settings';
      final body = jsonEncode({'admin_email': email});
      final Response response = await httpClient.postRequest(
        request,
        body: body,
      );
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
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> joinOrganization({required String adminEmail}) async {
    try {
      final String request = '/organization/join';
      final body = jsonEncode({'admin_email': adminEmail});
      final Response response = await httpClient.postRequest(
        request,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = (response.data is String)
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final bool success = data['success'] == true;
        final String message = (data['message'] as String?) ?? '';
        if (!success) {
          throw ServerException(message);
        }
        return message;
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<OrganizationUser>> getOrganizationUsers() async {
    try {
      const String request = '/organization/get-users';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = (response.data is String)
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final bool success = data['success'] == true;
        if (!success) {
          final message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final List<dynamic> list = data['users'] as List<dynamic>? ?? [];
        return list
            .whereType<Map<String, dynamic>>()
            .map(OrganizationUser.fromJson)
            .toList();
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
