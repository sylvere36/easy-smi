import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../domain/_commons/pagination.dart';
import '../../../domain/inspection/models/inspection_answers_post.dart';
import '../../../domain/inspection/models/inspection_detail.dart';
import '../../../domain/inspection/models/inspection_form_detail.dart';
import '../../../domain/inspection/models/inspection_form_item.dart';
import '../../../domain/inspection/models/inspection_item.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/files/file_manager.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IInspectionRemoteDataSource {
  Future<(List<InspectionItem>, Pagination)> getInspections({
    int page,
    int perPage,
  });

  Future<List<InspectionFormItem>> getInspectionForms();

  Future<InspectionDetail> getInspection({required int id});

  Future<List<InspectionSectionWithQuestions>> getInspectionFormSections({
    required int inspectionFormId,
  });

  Future<List<InspectionSectionWithQuestions>> getInspectionFormStructure({
    required int id,
  });

  Future<InspectionFormDetail> getInspectionFormDetail({required int id});

  Future<InspectionDetail> postInspectionAnswers({
    required int inspectionId,
    required InspectionAnswersPostBody body,
  });

  Future<InspectionDetail> postInspectionRemarks({
    required int inspectionId,
    required String otherRemark,
    required String recommendation,
  });
}

class InspectionRemoteDataSource implements IInspectionRemoteDataSource {
  final IAppRequests httpClient;
  final IFileManager fileManager;
  InspectionRemoteDataSource({
    required this.httpClient,
    required this.fileManager,
  });

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
  Future<List<InspectionFormItem>> getInspectionForms() async {
    try {
      const String request = '/conformity/inspection-forms';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final raw = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final data = raw['data'] as Map<String, dynamic>? ?? {};
        final listJson = (data['inspection_forms'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .toList();
        return listJson.map(InspectionFormItem.fromJson).toList();
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
  Future<List<InspectionSectionWithQuestions>> getInspectionFormStructure({
    required int id,
  }) async {
    try {
      final String request = '/conformity/inspection-forms/$id/structure';
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
  Future<InspectionFormDetail> getInspectionFormDetail({
    required int id,
  }) async {
    try {
      final String request = '/conformity/inspection-forms/$id';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final raw = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        return InspectionFormDetail.fromJson(raw);
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
      // Upload-first: ensure all imageLinks are server paths; keep existing http links as-is
      final updatedAnswers = <InspectionAnswerPostItem>[];
      for (final ans in body.answers) {
        final original = ans.imageLinks;
        if (original.isEmpty) {
          updatedAnswers.add(ans);
          continue;
        }
        // Collect non-http paths (local) to upload, preserving order mapping
        final toUploadPaths = <String>[];
        for (final link in original) {
          if (link.startsWith('http')) {
            continue;
          }
          final localPath = link.startsWith('file://')
              ? Uri.parse(link).toFilePath()
              : link;
          toUploadPaths.add(localPath);
        }
        // Upload local files and get server paths
        final uploadedPaths = await fileManager.uploadManyAndGetFullUrls(
          filePaths: toUploadPaths,
        );
        // Rebuild merged list preserving original order
        final merged = <String>[];
        int upIdx = 0;
        for (final link in original) {
          if (link.startsWith('http')) {
            merged.add(link);
          } else {
            merged.add(uploadedPaths[upIdx]);
            upIdx++;
          }
        }
        updatedAnswers.add(
          InspectionAnswerPostItem(
            id: ans.id,
            inspectionId: ans.inspectionId,
            inspectionQuestionId: ans.inspectionQuestionId,
            answer: ans.answer,
            conformityStatus: ans.conformityStatus,
            comment: ans.comment,
            imageLinks: merged,
            createdAt: ans.createdAt,
            updatedAt: ans.updatedAt,
          ),
        );
      }

      // Post answers with updated imageLinks
      log(
        'Posting answers with updated imageLinks: ${updatedAnswers.map((e) => e.imageLinks).toList()}',
      );

      // All answers are ready; post to server
      log(
        'Posting answers : ${updatedAnswers.map((e) => e.toJson()).toList()}',
      );

      final String request = '/conformity/inspections/$inspectionId/answers';
      final Response response = await httpClient.postRequest(
        request,
        body: InspectionAnswersPostBody(answers: updatedAnswers).toJson(),
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

  @override
  Future<InspectionDetail> postInspectionRemarks({
    required int inspectionId,
    required String otherRemark,
    required String recommendation,
  }) async {
    try {
      final String request = '/conformity/inspections/$inspectionId/remarks';
      final Response response = await httpClient.postRequest(
        request,
        body: {'other_remark': otherRemark, 'recommendation': recommendation},
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
