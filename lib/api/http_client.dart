import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../constantes/env.dart';
import '../injection_depency.dart';
import 'custom_interceptors.dart';

abstract class HttpClient{
  static final client = CustomDio(
    BaseOptions(
      baseUrl: SERVIDOR_API_URL,
      connectTimeout: const Duration(seconds: 25000),
      receiveTimeout: const Duration(seconds:16000),
    ),
  );
}

class CustomDio extends DioForNative {
  CustomDio(BaseOptions options) : super(options) {
    interceptors.add(
      dependency<CustomInterceptors>(),
    );
  }
}