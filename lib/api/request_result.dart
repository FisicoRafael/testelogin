import 'package:dio/dio.dart';

class RequestResult {
  final List<dynamic> data;
  final Map<String, List<String>> headers;
  final int? statusCode;
  final String? statusMessage;

  RequestResult(this.data, this.headers, this.statusCode, this.statusMessage);

  factory RequestResult.fromResponse(Response response) {
    return RequestResult(
      response.data is List ? response.data : [response.data],
      response.headers.map,
      response.statusCode,
      response.statusMessage,
    );
  }
}
