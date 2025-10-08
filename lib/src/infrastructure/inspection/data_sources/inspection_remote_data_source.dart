import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/_commons/pagination.dart';
import '../../../domain/inspection/models/inspection_answers_post.dart';
import '../../../domain/inspection/models/inspection_detail.dart';
import '../../../domain/inspection/models/inspection_item.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IInspectionRemoteDataSource {
  Future<(List<InspectionItem>, Pagination)> getInspections({
    int page,
    int perPage,
  });

  Future<InspectionDetail> getInspection({required int id});

  Future<List<InspectionSectionWithQuestions>> getInspectionFormSections({
    required int inspectionFormId,
  });

  Future<InspectionDetail> postInspectionAnswers({
    required int inspectionId,
    required InspectionAnswersPostBody body,
  });
}

class InspectionRemoteDataSource implements IInspectionRemoteDataSource {
  final IAppRequests httpClient;
  InspectionRemoteDataSource({required this.httpClient});

  @override
  Future<(List<InspectionItem>, Pagination)> getInspections({
    int page = 1,
    int perPage = 5,
  }) async {
    try {
      const String request = '/conformity/inspections';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final raw = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        // Expected envelope: { success: true, data: { inspections: [...], pagination: {...} } }
        final data = raw['data'] as Map<String, dynamic>? ?? {};
        final listJson = (data['inspections'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .toList();
        final items = listJson.map((e) => InspectionItem.fromJson(e)).toList();
        final pagJson = data['pagination'] as Map<String, dynamic>? ?? {};
        final pagination = Pagination(
          total: (pagJson['total'] as num?)?.toInt() ?? items.length,
          perPage: (pagJson['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (pagJson['current_page'] as num?)?.toInt() ?? page,
          lastPage:
              (pagJson['last_page'] as num?)?.toInt() ??
              (pagJson['total_pages'] as num?)?.toInt() ??
              1,
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
  Future<InspectionDetail> getInspection({required int id}) async {
    try {
      final String request = '/conformity/inspections/$id';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final raw = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final data = raw['data'] as Map<String, dynamic>? ?? {};
        return InspectionDetail.fromJson(data);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<InspectionSectionWithQuestions>> getInspectionFormSections({
    required int inspectionFormId,
  }) async {
    try {
      final String request = '/conformity/inspection-forms/$inspectionFormId';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final raw = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final list = (raw['data'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .map(InspectionSectionWithQuestions.fromJson)
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
  Future<InspectionDetail> postInspectionAnswers({
    required int inspectionId,
    required InspectionAnswersPostBody body,
  }) async {
    try {
      final String request = '/conformity/inspections/$inspectionId/answers';
      final Response response = await httpClient.postRequest(
        request,
        body: body.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final raw = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final data = raw['data'] as Map<String, dynamic>? ?? {};
        return InspectionDetail.fromJson(data);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
