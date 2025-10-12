import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../domain/_commons/pagination.dart';
import '../../../domain/quizz/models/quizz_item.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IQuizzRemoteDataSource {
  Future<(List<QuizzItem>, Pagination)> getQuizzes({int page, int perPage});
  Future<QuizzItem> getQuizzDetail({required int id});
}

class QuizzRemoteDataSource implements IQuizzRemoteDataSource {
  final IAppRequests httpClient;
  QuizzRemoteDataSource({required this.httpClient});

  @override
  Future<(List<QuizzItem>, Pagination)> getQuizzes({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      const String request = '/formation/quizz';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> root = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final Map<String, dynamic> wrap =
            (root['quizzs'] as Map<String, dynamic>?) ?? <String, dynamic>{};
        final List<Map<String, dynamic>> listJson =
            (wrap['data'] as List<dynamic>? ?? const [])
                .whereType<Map<String, dynamic>>()
                .toList();
        final items = listJson.map(QuizzItem.fromJson).toList();
        final pagination = Pagination(
          total: (wrap['total'] as num?)?.toInt() ?? items.length,
          perPage: (wrap['per_page'] as num?)?.toInt() ?? perPage,
          currentPage: (wrap['current_page'] as num?)?.toInt() ?? page,
          lastPage: (wrap['last_page'] as num?)?.toInt() ?? 1,
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
  Future<QuizzItem> getQuizzDetail({required int id}) async {
    try {
      final String request = '/formation/quizz/$id';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> root = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final Map<String, dynamic> data =
            root['quizz'] as Map<String, dynamic>? ?? <String, dynamic>{};
        return QuizzItem.fromJson(data);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
