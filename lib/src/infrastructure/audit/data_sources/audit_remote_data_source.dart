import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/_commons/pagination.dart';
import '../../../domain/audit/models/audit_item.dart';
import '../../../domain/audit/models/audit_document_request.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IAuditRemoteDataSource {
  Future<(List<AuditItem>, Pagination)> getAudits({int page, int perPage});

  Future<(List<AuditItem>, Pagination)> getOngoingAudits({
    int page,
    int perPage,
  });

  Future<(List<AuditItem>, Pagination)> getUpcomingAudits({
    int page,
    int perPage,
  });

  Future<AuditItem> getAudit({required int id});

  Future<String> changeStatus({required int id, required String status});

  Future<List<AuditDocumentRequest>> getAuditDocumentRequests({
    required int id,
  });
}

class AuditRemoteDataSource implements IAuditRemoteDataSource {
  final IAppRequests httpClient;
  AuditRemoteDataSource({required this.httpClient});

  @override
  Future<(List<AuditItem>, Pagination)> getAudits({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      const String request = '/conformity/audits';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final bool success = data['success'] == true;
        if (!success) {
          final String message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final resultData = data['data'] as Map<String, dynamic>;
        final auditsJson = resultData['audits'] as List<dynamic>? ?? [];
        final List<AuditItem> items = auditsJson
            .whereType<Map<String, dynamic>>()
            .map((e) => AuditItem.fromJson(e))
            .toList();
        final pagJson = resultData['pagination'] as Map<String, dynamic>;
        final pagination = Pagination(
          total: (pagJson['total'] as num?)?.toInt() ?? items.length,
          perPage: (pagJson['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (pagJson['current_page'] as num?)?.toInt() ?? page,
          lastPage: (pagJson['last_page'] as num?)?.toInt() ?? 1,
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
  Future<(List<AuditItem>, Pagination)> getOngoingAudits({
    int page = 1,
    int perPage = 10,
  }) async {
    return _fetchPaged(
      path: '/conformity/audits/ongoing',
      page: page,
      perPage: perPage,
    );
  }

  @override
  Future<(List<AuditItem>, Pagination)> getUpcomingAudits({
    int page = 1,
    int perPage = 10,
  }) async {
    return _fetchPaged(
      path: '/conformity/audits/upcoming',
      page: page,
      perPage: perPage,
    );
  }

  Future<(List<AuditItem>, Pagination)> _fetchPaged({
    required String path,
    required int page,
    required int perPage,
  }) async {
    try {
      final Response response = await httpClient.getRequest(
        path,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final bool success = data['success'] == true;
        if (!success) {
          final String message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final resultData = data['data'] as Map<String, dynamic>;
        final auditsJson = resultData['audits'] as List<dynamic>? ?? [];
        final List<AuditItem> items = auditsJson
            .whereType<Map<String, dynamic>>()
            .map((e) => AuditItem.fromJson(e))
            .toList();
        final pagJson = resultData['pagination'] as Map<String, dynamic>;
        final pagination = Pagination(
          total: (pagJson['total'] as num?)?.toInt() ?? items.length,
          perPage: (pagJson['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (pagJson['current_page'] as num?)?.toInt() ?? page,
          lastPage: (pagJson['last_page'] as num?)?.toInt() ?? 1,
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
  Future<AuditItem> getAudit({required int id}) async {
    try {
      final String request = '/conformity/audits/$id';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final bool success = data['success'] == true;
        if (!success) {
          final String message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final resultData = data['data'] as Map<String, dynamic>;
        final Map<String, dynamic> jsonItem =
            resultData['audit'] as Map<String, dynamic>? ??
            (resultData['audits'] is List &&
                    (resultData['audits'] as List).isNotEmpty
                ? (resultData['audits'] as List).first as Map<String, dynamic>
                : <String, dynamic>{});
        return AuditItem.fromJson(jsonItem);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> changeStatus({required int id, required String status}) async {
    try {
      final String request = '/conformity/audits/$id/status';
      final body = jsonEncode({'status': status});
      final Response response = await httpClient.postRequest(
        request,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
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
  Future<List<AuditDocumentRequest>> getAuditDocumentRequests({
    required int id,
  }) async {
    try {
      final String request = '/conformity/audits/$id/document-requests';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final bool success = data['success'] == true;
        if (!success) {
          final String message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final listJson = (data['data'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .toList();
        return listJson
            .map(
              (e) => AuditDocumentRequest(
                id: (e['id'] as num).toInt(),
                name: (e['name'] as String?) ?? '',
                createdAt: e['created_at'] as String?,
                documents: (e['documents'] as List<dynamic>? ?? [])
                    .whereType<Map<String, dynamic>>()
                    .map(
                      (d) => AuditAttachedDocument(
                        id: (d['id'] as num).toInt(),
                        documentRequestId: (d['document_request_id'] as num)
                            .toInt(),
                        documentPath: (d['document_path'] as String?) ?? '',
                        commentId: d['comment_id']?.toString(),
                        createdAt: d['created_at'] as String?,
                        updatedAt: d['updated_at'] as String?,
                      ),
                    )
                    .toList(),
              ),
            )
            .toList();
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
