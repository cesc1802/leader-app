import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:leader_app/flavor_config.dart';
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
    print(FlavorConfig.instance.values.baseUrl);
    final baseOptions =
        BaseOptions(baseUrl: FlavorConfig.instance.values.baseUrl);
    // BaseOptions(baseUrl: 'http://222.252.17.214:16000/appLanhDao/api/v1');
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
          if (_accessToken.isEmpty && !options.path.contains("/auth/login")) {
            _dio.lock();
            return SharedPreferences.getInstance().then((sharedPreferences) {
              TokenManager().load(sharedPreferences);

              logger.log('calling with access token: $_accessToken');
              options.headers['Authorization'] = 'Bearer $_accessToken';
              _dio.unlock();
              return handlers.next(options);
            });
          }
          if (!options.path.contains("/auth/login"))
            options.headers['Authorization'] = 'Bearer $_accessToken';
          return handlers.next(options);
        },
        onResponse: (Response response, handlers) {
          return handlers.next(response);
        },
        onError: (DioError e, handlers) async {
          // return handlers
          //     .next(NoInternetException(requestOptions: e.requestOptions));
          if (e.response == null) {
            throw NoInternetException(requestOptions: e.requestOptions);
          } else if (e.response!.statusCode == 401) {
            try {
              _dio.lock();
              await TokenManager().refresh().then((ok) {
                _dio.unlock();
                print(ok);
                // if (!ok)
                //   BlocProvider.of<AppStateBloc>(
                //           MyApp.navigatorKey.currentContext)
                //       .logout();
              });
            } catch (e) {
              print(e);
            }
            // return handlers.next(
            //   UnAuthorizeException(
            //     message: "UnAuthorizeException",
            //     requestOptions: e.requestOptions,
            //   ),
            // );
          } else if (e.response!.statusCode == 503) {
            return handlers.next(
              UnAuthorizeException(
                message: "Server going down",
                requestOptions: e.requestOptions,
              ),
            );
          } else if (e.response!.statusCode == 400) {
            if (e.response!.data is String) {
              handlers.next(
                BadRequestException(
                  message: "message",
                  requestOptions: e.requestOptions,
                ),
              );
            } else {}
          }
          return handlers.next(
            NoInternetException(
              requestOptions: e.requestOptions,
            ),
          );
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

class UnAuthorizeException extends DioError {
  UnAuthorizeException({
    required this.message,
    this.code,
    this.log,
    required requestOptions,
  }) : super(requestOptions: requestOptions);

  String? code;
  String? log;
  final int statusCode = 401;
  String message;
}

class BadRequestException extends DioError {
  BadRequestException({
    required this.message,
    this.code,
    this.log,
    required requestOptions,
  }) : super(requestOptions: requestOptions);

  String? code;
  String? log;
  final int statusCode = 400;
  String message;
}

class TimeoutException extends DioError {
  TimeoutException({required requestOptions})
      : super(requestOptions: requestOptions);
}

class NoInternetException extends DioError {
  NoInternetException({required requestOptions})
      : super(requestOptions: requestOptions);
}
