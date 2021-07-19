import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:leader_app/resources/error_response.dart';
import 'package:leader_app/resources/log_provider.dart';
import 'package:leader_app/resources/token_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Must be top-level function
dynamic _parseAndDecode(String response) {
  return jsonDecode(response);
}

class ApiProvider {
  late Dio _dio;

  String get _accessToken => TokenManager().accessToken;

  LogProvider get logger => const LogProvider('[ApiProvider]');

  static final ApiProvider _instance = ApiProvider._internal();
  factory ApiProvider() {
    return _instance;
  }

  ApiProvider._internal() {
    final baseOptions =
        BaseOptions(baseUrl: 'http://10.0.25.183/appLanhDao/api/v1');
    _dio = Dio(baseOptions);
    setupInterceptors();
    (_dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  }

  dynamic parseJson(String text) {
    return compute(_parseAndDecode, text);
  }

  void setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handlers) async {
          logger.log(
              'REQUEST[${options.method}] => PATH: ${options.baseUrl + options.path}');
          if (_accessToken.isEmpty) {
            _dio.lock();
            return SharedPreferences.getInstance().then((sharedPreferences) {
              TokenManager().load(sharedPreferences);

              logger.log('calling with access token: $_accessToken');
              options.headers['Authorization'] = 'Bearer $_accessToken';
              _dio.unlock();
              return handlers.next(options);
            });
          }
          options.headers['Authorization'] = 'Bearer $_accessToken';
          return handlers.next(options);
        },
        onResponse: (Response response, handlers) {
          return handlers.next(response);
        },
        onError: (DioError e, handlers) async {
          if (e.response == null) {
            // return ErrorResponse(
            //   code: 'ErrLostConnection',
            //   log: 'Lost connection',
            //   statusCode: 6996,
            //   message:
            //       'Your connection is gone, please try again', // need translate
            // );
          } else if (e.response!.statusCode == 401) {
            try {
              // _dio.lock();
              // await TokenManager().refresh().then((ok) {
              //   _dio.unlock();
              // if(!isOk)
              //   BlocProvider.of<AppStateBloc>(MyApp.navigatorKey.currentContext)
              //       .logout();
              // });
            } catch (e) {
              print(e);
            }
            // return e;
          } else if (e.response!.statusCode == 503) {
            // return ErrorResponse(
            //   code: 'ErrServerGoingDown',
            //   log: 'Server die',
            //   statusCode: 9669,
            //   message:
            //       'Service is unavailable now, please try again', // need translate
            // );
          } else if (e.response!.statusCode == 400) {
            if (e.response!.data is String) {
              // final Map<String, dynamic> data = json.decode(e.response!.data);
              // final Response r = ErrorResponse.fromJson(data);
              // return r;
            } else {
              // final Response err = ErrorResponse.fromJson(e.response!.data);
              // return err;
            }
          }

          // return ErrorResponse(
          //   code: 'ErrUndefined',
          //   log: 'Undefined error',
          //   statusCode: 0,
          //   message: 'Something went wrong', // need translate
          // );
        },
      ),
    );
  }

  void clear() {}

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final res = await _dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);

    if (res is! ErrorResponse) return res;
    throw res;
  }

  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final res = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    if (res is! ErrorResponse) {
      return res;
    }
    throw res;
  }

  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final res = await _dio.put(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onReceiveProgress);

    if (res is! ErrorResponse) return res;
    throw res;
  }

  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final res = await _dio.delete(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);

    if (res is! ErrorResponse) return res;
    throw res;
  }
}