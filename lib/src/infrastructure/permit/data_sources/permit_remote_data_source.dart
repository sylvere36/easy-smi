import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/_commons/pagination.dart';
import '../../../domain/permit/models/permit_item.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IPermitRemoteDataSource {
  Future<(List<PermitItem>, Pagination)> getPermits({int page, int perPage});
}

class PermitRemoteDataSource implements IPermitRemoteDataSource {
  final IAppRequests httpClient;
  PermitRemoteDataSource({required this.httpClient});

  @override
  Future<(List<PermitItem>, Pagination)> getPermits({
    int page = 1,
    int perPage = 10,
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
}
