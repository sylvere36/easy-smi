import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../domain/_commons/upload_response.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class IFileManager {
  /// Upload a file using multipart/form-data and return the uploaded resource info.
  /// [filePath] is the local path to the file to upload.
  /// Returns UploadResponse containing both `path` and `url`.
  Future<UploadResponse> upload({required String filePath});

  /// Helper: Upload a list of file paths and return the list of UploadResponse
  Future<List<UploadResponse>> uploadMany({required List<String> filePaths});

  /// Helper: Upload a file and return only its URL
  Future<String> uploadAndGetUrl({required String filePath});

  /// Helper: Upload a list of file paths and return only their URLs
  Future<List<String>> uploadManyAndGetUrls({required List<String> filePaths});

  /// Delete a previously uploaded file by its storage path
  /// Calls DELETE /minio/media/{path}
  Future<void> delete({required String path});

  /// Get a download URL for a file by its storage path
  /// Calls GET /minio/media/download/{path}
  /// Returns a direct or signed download URL as string
  Future<String> download({required String path});
}

class FileManager implements IFileManager {
  final IAppRequests httpClient;
  FileManager({required this.httpClient});

  @override
  Future<UploadResponse> upload({required String filePath}) async {
    try {
      const String request = '/minio/media';
      final fileName = filePath.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
      });

      final Response response = await httpClient.postRequest(
        request,
        body: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final raw = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);

        // The API may return either {path, url} directly or inside a data object.
        final obj = (raw['data'] is Map<String, dynamic>)
            ? raw['data'] as Map<String, dynamic>
            : raw;
        return UploadResponse.fromJson(obj);
      }
      throw ServerException(errorThrow(response));
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<UploadResponse>> uploadMany({
    required List<String> filePaths,
  }) async {
    if (filePaths.isEmpty) return <UploadResponse>[];
    return Future.wait(filePaths.map((p) => upload(filePath: p)));
  }

  @override
  Future<String> uploadAndGetUrl({required String filePath}) async {
    final up = await upload(filePath: filePath);
    return up.path;
  }

  @override
  Future<List<String>> uploadManyAndGetUrls({
    required List<String> filePaths,
  }) async {
    if (filePaths.isEmpty) return <String>[];
    final uploaded = await uploadMany(filePaths: filePaths);
    return uploaded.map((e) => e.path).toList();
  }

  @override
  Future<void> delete({required String path}) async {
    try {
      final String encodedPath = Uri.encodeComponent(path);
      final String request = '/minio/media/$encodedPath';
      final Response response = await httpClient.deleteRequest(request);
      if (response.statusCode == 200 || response.statusCode == 204) {
        return;
      }
      throw ServerException(errorThrow(response));
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> download({required String path}) async {
    try {
      final String encodedPath = Uri.encodeComponent(path);
      final String request = '/minio/media/download/$encodedPath';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final raw = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        // API may return {url} or {data: {url}}
        final obj = (raw['data'] is Map<String, dynamic>)
            ? raw['data'] as Map<String, dynamic>
            : raw;
        final url = obj['url'] as String?;
        if (url == null || url.isEmpty) {
          throw ServerException('No download url returned');
        }
        return url;
      }
      throw ServerException(errorThrow(response));
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
