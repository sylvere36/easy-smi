import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/_commons/pagination.dart';
import '../../../domain/event/models/cause_analysis.dart';
import '../../../domain/event/models/event_item.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/files/file_manager.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IEventRemoteDataSource {
  Future<(List<EventItem>, Pagination)> getEvents({
    int perPage = 10,
    int page = 1,
  });
  Future<List<CauseAnalysis>> getCauseAnalysis({required int event});
  Future<EventItem> addEvent({
    required String title,
    required String description,
    DateTime? date,
    String? site,
    required String type,
    required String gravity,
    required List<String> files,
  });
  Future<String> requestValidation({required int id, String? comment});
}

class EventRemoteDataSource implements IEventRemoteDataSource {
  final IAppRequests httpClient;
  final IFileManager fileManager;

  EventRemoteDataSource({required this.httpClient, required this.fileManager});

  @override
  Future<(List<EventItem>, Pagination)> getEvents({
    int perPage = 10,
    int page = 1,
  }) async {
    try {
      const String request = '/conformity/event-forms';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        // final bool success = data['success'] == true;
        // if (!success) {
        //   final String message = (data['message'] as String?) ?? '';
        //   throw ServerException(message);
        // }
        final resultData = data['data'] as List<dynamic>? ?? [];
        final List<EventItem> items = resultData
            .whereType<Map<String, dynamic>>()
            .map((e) => EventItem.fromJson(e))
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
  Future<List<CauseAnalysis>> getCauseAnalysis({required int event}) async {
    try {
      final String request = '/conformity/events/$event/whys';
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
        final resultData = data['data'] as List<dynamic>? ?? [];
        final List<CauseAnalysis> items = resultData
            .whereType<Map<String, dynamic>>()
            .map((e) => CauseAnalysis.fromJson(e))
            .toList();

        return items;
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<EventItem> addEvent({
    required String title,
    required String description,
    DateTime? date,
    String? site,
    required String type,
    required String gravity,
    required List<String> files,
  }) async {
    try {
      const String request = '/conformity/event-forms';
      // Upload-first: upload files to get URLs using helper, then send JSON body with URLs
      final List<String> attachmentUrls = await fileManager
          .uploadManyAndGetUrls(filePaths: files);
      final Map<String, dynamic> body = {
        'title': title,
        'description': description,
        'type': type,
        'gravity': gravity,
        'date': date?.toIso8601String(),
        'site': site,
        'attachments': attachmentUrls,
      };
      final Response response = await httpClient.postRequest(
        request,
        body: body,
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

        return EventItem.fromJson(resultData);
      } else {
        throw ServerException(errorThrow(response));
      }
    } on ServerException catch (e) {
      throw ServerException(e.errorText);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> requestValidation({required int id, String? comment}) async {
    try {
      final String request = '/conformity/event-forms/$id/requestValidation';
      final dynamic body = comment == null ? null : jsonEncode({'comment': comment});
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
}
