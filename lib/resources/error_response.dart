import 'package:dio/dio.dart';

class ErrorResponse extends Response<String> {
  String? code;
  String? log;
  int? statusCode;
  String? message;

  ErrorResponse({
    this.log,
    this.code,
    this.statusCode,
    required this.message,
    required RequestOptions requestOptions,
  }) : super(requestOptions: requestOptions);

  // ErrorResponse.fromJson(Map<String, dynamic> json) {
  //   code = json['code'];
  //   log = json['log'];
  //   statusCode = json['status_code'];
  //   message = json['message'];
  // }

  @override
  String toString() {
    return "message";
  }
}
