class AppError {
  final int? statusCode;
  final String? message;
  final String? errorKey;

  AppError.fromJson(Map<String, dynamic> json)
      : statusCode = json['statusCode'],
        message = json['message'],
        errorKey = json['errorKey'];

  const AppError.error({this.message, this.errorKey, this.statusCode});
  const AppError({this.statusCode, this.message, this.errorKey});
}

enum ErrorCode { NOT_AUTHEN, WRONG_PASSWORD }
