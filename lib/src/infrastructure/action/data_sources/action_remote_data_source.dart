import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/action/models/action_item.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_http_service.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IActionRemoteDataSource {
  Future<List<ActionItem>> getActions();
  Future<List<ActionItem>> getActionsByOrigin({
    required String originType,
    required int originId,
  });
  Future<ActionItem> getAction({required int id});

  Future<String> requestValidation({required int id, String? comment});

  Future<String> requestRevision({required int id});

  Future<String> submitRevision({required int id, String? revisionComment});

  /// Returns the raw bytes of the file for printing/downloading action document
  Future<Response<List<int>>> downloadActionDocument({required int id});
}

class ActionRemoteDataSource implements IActionRemoteDataSource {
  final IAppRequests httpClient;
  ActionRemoteDataSource({required this.httpClient});

  @override
  Future<List<ActionItem>> getActions() async {
    try {
      const String request = '/action/action';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as List<dynamic>
            : (response.data as List<dynamic>);
        return data
            .whereType<Map<String, dynamic>>()
            .map((e) => ActionItem.fromJson(e))
            .toList();
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ActionItem>> getActionsByOrigin({
    required String originType,
    required int originId,
  }) async {
    try {
      const String request = '/action/action/find';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'origin_type': originType, 'origin_id': originId},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as List<dynamic>
            : (response.data as List<dynamic>);
        return data
            .whereType<Map<String, dynamic>>()
            .map((e) => ActionItem.fromJson(e))
            .toList();
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ActionItem> getAction({required int id}) async {
    try {
      final String request = '/action/action/show/$id';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        return ActionItem.fromJson(data);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> requestValidation({required int id, String? comment}) async {
    try {
      final String request = '/action/action/$id/requestValidation';
      final body = comment == null ? null : jsonEncode({'comment': comment});
      final Response response = await httpClient.postRequest(
        request,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = (response.data is String)
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final bool success = data['success'] == true;
        final String message = (data['message'] as String?) ?? '';
        if (!success) throw ServerException(message);
        return message;
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> requestRevision({required int id}) async {
    try {
      final String request = '/action/action/$id/requestRevision';
      final Response response = await httpClient.postRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = (response.data is String)
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final bool success = data['success'] == true;
        final String message = (data['message'] as String?) ?? '';
        if (!success) throw ServerException(message);
        return message;
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> submitRevision({
    required int id,
    String? revisionComment,
  }) async {
    try {
      final String request = '/action/action/$id/submitRevision';
      final body = revisionComment == null
          ? null
          : jsonEncode({'revision_comment': revisionComment});
      final Response response = await httpClient.postRequest(
        request,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = (response.data is String)
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final bool success = data['success'] == true;
        final String message = (data['message'] as String?) ?? '';
        if (!success) throw ServerException(message);
        return message;
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Response<List<int>>> downloadActionDocument({required int id}) async {
    try {
      final String request = '/monitoring/get-draft/ACT/$id';
      // We need a raw bytes response
      final dio = AppHttpService.getInstance();
      final Response<List<int>> response = await dio.get<List<int>>(
        request,
        options: Options(responseType: ResponseType.bytes),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
