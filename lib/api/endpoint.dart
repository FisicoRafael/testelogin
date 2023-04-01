import 'package:dio/dio.dart';
import 'http_client.dart';
import 'request_result.dart';

enum Method { GET, POST, PATCH, PUT, DELETE }

class EndPoint {
  final Method method;
  final String url;
  final Map<String, dynamic>? headers;
  final dynamic data;
  final Map<String, dynamic>? queryParams;
  final bool isFormUrlEncoded;

  const EndPoint({
    required this.method,
    required this.url,
    this.headers,
    this.data,
    this.queryParams,
    this.isFormUrlEncoded = false,
  });

  Future<RequestResult> request() async {
    final response = await HttpClient.client.request(
      url,
      data: data??null,
      //queryParameters: queryParams ?? null,
      options: Options(
        headers: headers,
        method: _methodToString(method),
        responseType: ResponseType.json,
        contentType:
            isFormUrlEncoded ? Headers.formUrlEncodedContentType : null,
      ),
    );
    return RequestResult.fromResponse(response);
  }

  String _methodToString(Method method) {
    switch (method) {
      case Method.GET:
        return 'GET';
      case Method.POST:
        return 'POST';
      case Method.DELETE:
        return 'DELETE';
      default:
        return 'PATCH';
    }
  }
}
