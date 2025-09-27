import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/_commons/pagination.dart';
import '../../../domain/event/models/event_item.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IEventRemoteDataSource {
  Future<(List<EventItem>, Pagination)> getEvents({
    int perPage = 10,
    int page = 1,
  });
  
}

class EventRemoteDataSource implements IEventRemoteDataSource {
  final IAppRequests httpClient;
  EventRemoteDataSource({required this.httpClient});

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
}
