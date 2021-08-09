import 'package:dio/dio.dart';
import 'package:leader_app/features/decision/provider/app_error.dart';

abstract class Repository {
  void handleError(Object? e) {
    if (e is DioError) {
      AppError error = AppError(message: '', errorKey: '', statusCode: 0);
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // TODO: Handle this case.
          error = AppError.error(message: 'DioErrorType.connectTimeout');
          break;
        case DioErrorType.sendTimeout:
          error = AppError.error(message: 'DioErrorType.sendTimeout');
          break;
        case DioErrorType.receiveTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.response:
          // TODO: Handle this case.
          break;
        case DioErrorType.cancel:
          error = AppError.error(message: 'DioErrorType.cancel');

          break;
        case DioErrorType.other:
          try {
            error = AppError.fromJson(e.response!.data);
          } catch (e) {
            error = AppError.error(message: 'DioErrorType.other');
          }
          break;
      }
      throw error;
    }
  }
}
