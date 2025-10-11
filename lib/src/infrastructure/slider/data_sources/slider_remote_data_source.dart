import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/_commons/pagination.dart';
import '../../../domain/slider/models/slider_item.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class ISliderRemoteDataSource {
  Future<(List<SliderItem>, Pagination)> getSliders({int page});
}

class SliderRemoteDataSource implements ISliderRemoteDataSource {
  final IAppRequests httpClient;
  SliderRemoteDataSource({required this.httpClient});

  @override
  Future<(List<SliderItem>, Pagination)> getSliders({int page = 1}) async {
    try {
      final String request = '/formation/sliders';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> root = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);

        final List<Map<String, dynamic>> listJson =
            (root['data'] as List<dynamic>? ?? const [])
                .whereType<Map<String, dynamic>>()
                .toList();
        final items = listJson.map(SliderItem.fromJson).toList();

        final pagination = Pagination(
          total: (root['total'] as num?)?.toInt() ?? items.length,
          perPage: (root['per_page'] as num?)?.toInt() ?? items.length,
          currentPage: (root['current_page'] as num?)?.toInt() ?? page,
          lastPage: (root['last_page'] as num?)?.toInt() ?? 1,
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
