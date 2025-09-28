import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/evaluation/models/evaluation.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IEvaluationRemoteDataSource {
  Future<List<EvaluationItem>> getEventEvaluations({required int event});
}

class EvaluationRemoteDataSource implements IEvaluationRemoteDataSource {
  final IAppRequests httpClient;
  EvaluationRemoteDataSource({required this.httpClient});

  @override
  Future<List<EvaluationItem>> getEventEvaluations({required int event}) async {
    try {
      final String request = '/conformity/events/$event/evaluations';
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
        final List<EvaluationItem> items = resultData
            .whereType<Map<String, dynamic>>()
            .map((e) => EvaluationItem.fromJson(e))
            .toList();

        return items;
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
