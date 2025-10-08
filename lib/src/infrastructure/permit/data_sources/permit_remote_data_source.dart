import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../domain/_commons/pagination.dart';
import '../../../domain/permit/models/permit_detail.dart';
import '../../../domain/permit/models/permit_fire_control.dart';
import '../../../domain/permit/models/permit_item.dart';
import '../../../domain/permit/models/permit_personnel_assignment.dart';
import '../../../domain/permit/models/permit_risk_assessment.dart';
import '../../../domain/permit/models/permit_risk_assessment_request.dart';
import '../../../domain/permit/models/permit_type_control.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/files/file_manager.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IPermitRemoteDataSource {
  Future<(List<PermitItem>, Pagination)> getPermits({int page, int perPage});

  Future<PermitDetail> getPermit({required int id});

  Future<(List<PermitPersonnelAssignment>, Pagination)> getPermitPersonnel({
    required int id,
    int page,
    int perPage,
  });

  Future<(List<PermitTypeControl>, Pagination)> getPermitTypeControls({
    required int id,
    int page,
    int perPage,
  });

  Future<(List<PermitFireControl>, Pagination)> getPermitFireControls({
    required int id,
    int page,
    int perPage,
  });

  Future<(List<PermitRiskAssessment>, Pagination)> getPermitRiskAssessments({
    required int id,
    int page,
    int perPage,
  });

  Future<PermitRiskAssessment> setRiskAssessment({
    required int id,
    required int workPermitId,
    required int evaluatorId,
    required List<PermitRiskAssessmentQuestionInput> questions,
    required String status,
    required String conclusion,
  });
}

class PermitRemoteDataSource implements IPermitRemoteDataSource {
  final IAppRequests httpClient;
  final IFileManager fileManager;

  PermitRemoteDataSource({required this.httpClient, required this.fileManager});

  @override
  Future<(List<PermitItem>, Pagination)> getPermits({
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      const String request = '/conformity/work-permits';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        // Le backend semble renvoyer { data: [...], pagination: {...} }
        final listJson = (data['data'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .toList();
        final items = listJson.map((e) => PermitItem.fromJson(e)).toList();
        final pagJson = data['pagination'] as Map<String, dynamic>? ?? {};
        final pagination = Pagination(
          total: (pagJson['total'] as num?)?.toInt() ?? items.length,
          perPage: (pagJson['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (pagJson['current_page'] as num?)?.toInt() ?? page,
          lastPage: (pagJson['total_pages'] as num?)?.toInt() ?? 1,
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
  Future<(List<PermitFireControl>, Pagination)> getPermitFireControls({
    required int id,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final String request = '/conformity/work-permits/$id/fire-controls';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final listJson = (data['data'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .toList();
        final items = listJson
            .map((e) => PermitFireControl.fromJson(e))
            .toList();
        final pagJson = data['pagination'] as Map<String, dynamic>? ?? {};
        final pagination = Pagination(
          total: (pagJson['total'] as num?)?.toInt() ?? items.length,
          perPage: (pagJson['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (pagJson['current_page'] as num?)?.toInt() ?? page,
          lastPage: (pagJson['total_pages'] as num?)?.toInt() ?? 1,
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
  Future<PermitDetail> getPermit({required int id}) async {
    try {
      final String request = '/conformity/work-permits/$id';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final itemJson = data['data'] as Map<String, dynamic>? ?? {};
        return PermitDetail.fromJson(itemJson);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<(List<PermitPersonnelAssignment>, Pagination)> getPermitPersonnel({
    required int id,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final String request = '/conformity/work-permits/$id/personnel';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final listJson = (data['data'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .toList();
        final items = listJson
            .map((e) => PermitPersonnelAssignment.fromJson(e))
            .toList();
        final pagJson = data['pagination'] as Map<String, dynamic>? ?? {};
        final pagination = Pagination(
          total: (pagJson['total'] as num?)?.toInt() ?? items.length,
          perPage: (pagJson['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (pagJson['current_page'] as num?)?.toInt() ?? page,
          lastPage: (pagJson['total_pages'] as num?)?.toInt() ?? 1,
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
  Future<(List<PermitTypeControl>, Pagination)> getPermitTypeControls({
    required int id,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final String request = '/conformity/work-permits/$id/type-controls';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final raw = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        // Backend returns { success: true, data: { current_page, data: [...], last_page, per_page, total, ... } }
        final data = raw['data'] as Map<String, dynamic>? ?? {};
        final listJson = (data['data'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .toList();
        final items = listJson
            .map((e) => PermitTypeControl.fromJson(e))
            .toList();
        final pagination = Pagination(
          total: (data['total'] as num?)?.toInt() ?? items.length,
          perPage: (data['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (data['current_page'] as num?)?.toInt() ?? page,
          lastPage: (data['last_page'] as num?)?.toInt() ?? 1,
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
  Future<(List<PermitRiskAssessment>, Pagination)> getPermitRiskAssessments({
    required int id,
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final String request = '/conformity/work-permits/$id/risk-assessments';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final listJson = (data['data'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .toList();
        final items = listJson
            .map((e) => PermitRiskAssessment.fromJson(e))
            .toList();
        final pagJson = data['pagination'] as Map<String, dynamic>? ?? {};
        final pagination = Pagination(
          total: (pagJson['total'] as num?)?.toInt() ?? items.length,
          perPage: (pagJson['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (pagJson['current_page'] as num?)?.toInt() ?? page,
          lastPage: (pagJson['total_pages'] as num?)?.toInt() ?? 1,
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
  Future<PermitRiskAssessment> setRiskAssessment({
    required int id,
    required int workPermitId,
    required int evaluatorId,
    required List<PermitRiskAssessmentQuestionInput> questions,
    required String status,
    required String conclusion,
  }) async {
    try {
      final String request = '/conformity/work-permits/$id/risk-assessments';
      // Upload-first: convert each evidence local path to remote URL via FileManager, then send URLs in JSON body
      final List<Map<String, dynamic>> questionsPayload = [];
      for (final q in questions) {
        final urls = q.evidences.isEmpty
            ? <String>[]
            : await fileManager.uploadManyAndGetUrls(filePaths: q.evidences);
        questionsPayload.add({
          'response': q.response,
          'comment': q.comment,
          'evidences': urls,
        });
      }

      final Map<String, dynamic> body = {
        'work_permit_id': workPermitId,
        'evaluator_id': evaluatorId,
        'status': status,
        'conclusion': conclusion,
        'questions': questionsPayload,
      };

      log(
        'Submitting RiskAssessment with ${questions.length} questions (upload first).',
      );
      final Response response = await httpClient.postRequest(
        request,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final itemJson = data['data'] as Map<String, dynamic>? ?? {};
        return PermitRiskAssessment.fromJson(itemJson);
      } else {
        throw ServerException(errorThrow(response));
      }
    } on ServerException catch (e) {
      throw ServerException(e.errorText);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
