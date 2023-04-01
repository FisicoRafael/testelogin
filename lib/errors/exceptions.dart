import 'package:dio/dio.dart';

class ServerException implements Exception {}

class NoImageException implements Exception {}

class RequestException extends DioError {
  RequestException({
    required String? message,
    required RequestOptions? options,
    int? code,
  }) : super(error: message, requestOptions: options!);
}