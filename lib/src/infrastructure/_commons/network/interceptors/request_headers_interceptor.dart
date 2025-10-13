import 'dart:developer';

import 'package:dio/dio.dart';

import '../app_http_service.dart';
import '../user_session.dart';

enum ContentType { json, formData, wwwFormUrlEncode }

abstract class RequestHeaderInterceptor {
  dynamic requestInterceptor(RequestOptions options);
}

Future<void> _performInterceptor(
  RequestOptions options,
  RequestInterceptorHandler handler,
  ContentType contentType,
) async {
  String optionHeaderContentType = '';
  switch (contentType) {
    case ContentType.json:
      optionHeaderContentType = 'application/json';
      break;
    case ContentType.formData:
      optionHeaderContentType = 'multipart/form-data';
      break;
    case ContentType.wwwFormUrlEncode:
      optionHeaderContentType = 'application/x-www-form-urlencoded';
      break;
  }

  options.headers['Content-Type'] = optionHeaderContentType;

  final String? lang = await myUserSession.getLocaleLanguage();
  if (lang != null) {
    final String langSend = lang.split('_')[0];
    options.headers['Accept-Language'] = langSend;
  }

  final String? token = await myUserSession.getAuthToken();
  if (token != null) {
    log('Authorization: Bearer $token');
    options.headers['Authorization'] = 'Bearer $token';
  }
  return handler.next(options);
}

class RequestHeaderInterceptorJsonImpl extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return _performInterceptor(options, handler, ContentType.json);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Only attempt refresh if 401 and we have a refresh token
    if (err.response?.statusCode == 401) {
      final refreshToken = await myUserSession.getRefreshToken();
      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          final dio = AppHttpService.getInstance();
          final res = await dio.post(
            '/auth/refresh-token',
            data: {'refreshToken': refreshToken},
            options: Options(headers: {'Content-Type': 'application/json'}),
          );
          if (res.statusCode == 200 || res.statusCode == 201) {
            final data = res.data as Map<String, dynamic>;
            final newAccess = data['accessToken']?.toString();
            final newRefresh = data['refreshToken']?.toString();
            if (newAccess != null && newAccess.isNotEmpty) {
              await myUserSession.cacheAuthToken(newAccess);
            }
            if (newRefresh != null && newRefresh.isNotEmpty) {
              await myUserSession.cacheRefreshToken(newRefresh);
            }

            // Clone and retry original request with new token
            final RequestOptions requestOptions = err.requestOptions;
            final Options options = Options(
              method: requestOptions.method,
              headers: {
                ...requestOptions.headers,
                if (newAccess != null) 'Authorization': 'Bearer $newAccess',
              },
              responseType: requestOptions.responseType,
              contentType: requestOptions.contentType,
              followRedirects: requestOptions.followRedirects,
              receiveTimeout: requestOptions.receiveTimeout,
              sendTimeout: requestOptions.sendTimeout,
            );
            final Response retryResponse = await dio.request(
              requestOptions.path,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
              options: options,
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              onSendProgress: requestOptions.onSendProgress,
            );
            return handler.resolve(retryResponse);
          }
        } catch (e) {
          // Fallthrough to original error handling
        }
      }
    }
    return handler.next(err);
  }
}

class RequestHeaderInterceptorFormUrlEncodeImpl extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return _performInterceptor(options, handler, ContentType.wwwFormUrlEncode);
  }
}
