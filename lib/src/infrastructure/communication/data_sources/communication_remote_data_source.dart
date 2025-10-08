import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/communication/models/comment.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/files/file_manager.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class ICommunicationRemoteDataSource {
  Future<List<CommentItem>> getComments({
    required String commentableType,
    required int commentableId,
  });

  Future<CommentItem> addComment({
    required String body,
    String? memo,
    required String commentableType,
    required int commentableId,
    String? attachmentPath,
    int? parentId,
  });

  Future<void> addReaction({required int commentId, required String reaction});
}

class CommunicationRemoteDataSource implements ICommunicationRemoteDataSource {
  final IAppRequests httpClient;
  final IFileManager fileManager;
  CommunicationRemoteDataSource({
    required this.httpClient,
    required this.fileManager,
  });

  @override
  Future<List<CommentItem>> getComments({
    required String commentableType,
    required int commentableId,
  }) async {
    try {
      const String request = '/communication/comments/by-object';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {
          'commentable_type': commentableType,
          'commentable_id': commentableId,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic raw = response.data;
        if (raw is String) raw = json.decode(raw);
        List<dynamic> list;
        if (raw is Map<String, dynamic> && raw['data'] is List) {
          list = raw['data'] as List<dynamic>;
        } else if (raw is List) {
          list = raw;
        } else {
          list = const [];
        }
        return list
            .whereType<Map<String, dynamic>>()
            .map(CommentItem.fromJson)
            .toList();
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CommentItem> addComment({
    required String body,
    String? memo,
    required String commentableType,
    required int commentableId,
    String? attachmentPath,
    int? parentId,
  }) async {
    try {
      const String request = '/communication/comments';
      // Upload-first: upload attachment to get URL, then send JSON body with URL
      final String? attachmentUrl =
          (attachmentPath != null && attachmentPath.isNotEmpty)
          ? await fileManager.uploadAndGetUrl(filePath: attachmentPath)
          : null;
      final Map<String, dynamic> bodyMap = {
        'body': body,
        'memo': memo,
        'commentable_type': commentableType,
        'commentable_id': commentableId,
        if (parentId != null) 'parent_id': parentId,
        if (attachmentUrl != null) 'attachment_url': attachmentUrl,
      };
      final Response response = await httpClient.postRequest(
        request,
        body: bodyMap,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic raw = response.data;
        if (raw is String) raw = json.decode(raw);
        Map<String, dynamic>? data;
        if (raw is Map<String, dynamic>) {
          if (raw['data'] is Map<String, dynamic>) {
            data = raw['data'] as Map<String, dynamic>;
          } else if (raw['comment'] is Map<String, dynamic>) {
            data = raw['comment'] as Map<String, dynamic>;
          } else if (raw['id'] != null) {
            data = raw; // direct comment object
          }
        }
        if (data == null) {
          throw ServerException('Invalid response format');
        }
        return CommentItem.fromJson(data);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addReaction({
    required int commentId,
    required String reaction,
  }) async {
    try {
      final String request = '/communication/comments/react/$commentId';
      final Response response = await httpClient.postRequest(
        request,
        body: {'reaction': reaction},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return; // success
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
