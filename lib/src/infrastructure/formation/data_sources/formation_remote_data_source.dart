import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/_commons/pagination.dart';
import '../../../domain/formation/models/formation_detail.dart';
import '../../../domain/formation/models/formation_item.dart';
import '../../../domain/formation/models/formation_participant_registration.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IFormationRemoteDataSource {
  Future<(List<FormationItem>, Pagination)> getFormations({
    int page,
    int perPage,
  });
  Future<FormationDetail> getFormation({required int id});
  Future<List<FormationParticipantRegistration>> getFormationParticipants({
    required int id,
  });
}

class FormationRemoteDataSource implements IFormationRemoteDataSource {
  final IAppRequests httpClient;
  FormationRemoteDataSource({required this.httpClient});

  @override
  Future<(List<FormationItem>, Pagination)> getFormations({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      const String request = '/formation/formations/paginated';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final success = data['success'] == true;
        if (!success) {
          final message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final resultData = data['data'] as Map<String, dynamic>;
        final listJson = (resultData['data'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .toList();
        final items = listJson.map((e) => FormationItem.fromJson(e)).toList();
        final pagination = Pagination(
          total: (resultData['total'] as num?)?.toInt() ?? items.length,
          perPage: (resultData['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (resultData['current_page'] as num?)?.toInt() ?? page,
          lastPage: (resultData['last_page'] as num?)?.toInt() ?? 1,
        );
        return (items, pagination);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<FormationDetail> getFormation({required int id}) async {
    try {
      final String request = '/formation/formations/$id';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final success = data['success'] == true;
        if (!success) {
          final message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final jsonItem = data['data'] as Map<String, dynamic>? ?? {};
        return FormationDetail.fromJson(jsonItem);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<FormationParticipantRegistration>> getFormationParticipants({
    required int id,
  }) async {
    try {
      final String request = '/formation/formations/$id/participants';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final success = data['success'] == true;
        if (!success) {
          final message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final list = (data['data'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .map((e) => FormationParticipantRegistration.fromJson(e))
            .toList();
        return list;
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
