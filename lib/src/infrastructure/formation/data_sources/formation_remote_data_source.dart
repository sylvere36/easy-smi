import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/_commons/pagination.dart';
import '../../../domain/formation/models/finish_course_result.dart';
import '../../../domain/formation/models/finish_formation_result.dart';
import '../../../domain/formation/models/formation_course.dart';
import '../../../domain/formation/models/formation_detail.dart';
import '../../../domain/formation/models/formation_item.dart';
import '../../../domain/formation/models/formation_participant_registration.dart';
import '../../../domain/formation/models/my_formation.dart';
import '../../../domain/formation/models/start_course_result.dart';
import '../../../domain/formation/models/user_formations_registrations.dart';
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
  Future<List<MyFormation>> getMyFormations();
  Future<List<FormationCourse>> getFormationCourses({required int id});
  Future<StartCourseResult> startCourse({required int id});
  Future<FinishCourseResult> finishCourse({required int id});
  Future<FinishFormationResult> finishFormation({required int id});
  Future<UserFormationsRegistrations> getUserFormationsRegistrations();
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
      const String request = '/formation/formations-published';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> root = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);

        final List<Map<String, dynamic>> listJson =
            (root['data'] as List<dynamic>? ?? const [])
                .whereType<Map<String, dynamic>>()
                .toList();
        final items = listJson.map(FormationItem.fromJson).toList();

        final meta = root['meta'] as Map<String, dynamic>?;
        final pagination = Pagination(
          total: (meta?['total'] as num?)?.toInt() ?? items.length,
          perPage: (meta?['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (meta?['current_page'] as num?)?.toInt() ?? page,
          lastPage: (meta?['last_page'] as num?)?.toInt() ?? 1,
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

  @override
  Future<List<MyFormation>> getMyFormations() async {
    try {
      const String request = '/formation/my-formations';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final List<dynamic> rawList = data is String
            ? (json.decode(data) as List<dynamic>? ?? const [])
            : (data as List<dynamic>? ?? const []);
        return rawList
            .whereType<Map<String, dynamic>>()
            .map(MyFormation.fromJson)
            .toList();
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<FormationCourse>> getFormationCourses({required int id}) async {
    try {
      final String request = '/formation/formations/$id/courses';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> root = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final List<Map<String, dynamic>> listJson =
            (root['data'] as List<dynamic>? ?? const [])
                .whereType<Map<String, dynamic>>()
                .toList();
        return listJson.map(FormationCourse.fromJson).toList();
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<StartCourseResult> startCourse({required int id}) async {
    try {
      final String request = '/formation/courses/$id/start';
      final Response response = await httpClient.postRequest(request, body: {});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> root = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final success = root['success'] == true;
        if (!success) {
          final message = (root['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final data = root['data'] as Map<String, dynamic>? ?? {};
        return StartCourseResult.fromJson(data);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<FinishCourseResult> finishCourse({required int id}) async {
    try {
      final String request = '/formation/courses/$id/finish';
      final Response response = await httpClient.postRequest(request, body: {});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> root = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final success = root['success'] == true;
        if (!success) {
          final message = (root['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final data = root['data'] as Map<String, dynamic>? ?? {};
        return FinishCourseResult.fromJson(data);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<FinishFormationResult> finishFormation({required int id}) async {
    try {
      final String request = '/formation/formations/$id/finish';
      final Response response = await httpClient.postRequest(request, body: {});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> root = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final success = root['success'] == true;
        if (!success) {
          final message = (root['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final data = root['data'] as Map<String, dynamic>? ?? {};
        return FinishFormationResult.fromJson(data);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserFormationsRegistrations> getUserFormationsRegistrations() async {
    try {
      const String request = '/formation/registrations/user/formations';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> root = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final success = root['success'] == true;
        if (!success) {
          final message = (root['message'] as String?) ?? '';
          throw ServerException(message);
        }
        return UserFormationsRegistrations.fromJson(root);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
