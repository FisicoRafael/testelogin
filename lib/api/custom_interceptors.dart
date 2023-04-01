import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../errors/exceptions.dart';
import '../storage/storage_local.dart';

class CustomInterceptors extends InterceptorsWrapper {
  final InternetConnectionChecker internetConnectionChecker;
  final StorageLocal storageLocal;

  CustomInterceptors(
      {required this.internetConnectionChecker, required this.storageLocal});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!await internetConnectionChecker.hasConnection) {
      return handler.reject(RequestException(
          message: 'Não há internet. Verifique sua conexão e tente novamente',
          options: options));
    }
    final token = await storageLocal.getToken();
    print("Request --> Token: $token");
    options.headers = {'Accept': 'application/json'};
    options.headers['Authorization'] = 'Bearer $token';
    options.responseType = ResponseType.json;
    print('Request --> ${options.method} ${options.uri}');
    print('Request --> headers: ${options.headers}');
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    String message;
    if (err.type == DioErrorType.connectionTimeout) {
      message = "Tempo excedido para conexão";
    } else if (err.type == DioErrorType.unknown) {
      message = err.message ?? "";
      return handler.reject(RequestException(
          code: 401, //
          message: message,
          options: err.requestOptions));
    } else if (err.response != null && err.response!.statusCode == 401) {
      return handler.reject(RequestException(
        code: 401,
        options: err.requestOptions,
        message: err.response!.data['message'] ?? "Ocorreu um erro",
      ));
    } else if (err.response != null && err.response!.statusCode == 422) {
      print("Erro 422: ${err.response!.data}");
      message =
          'Erro 422: ${err.response!.data['errors']}\nPreencha todos os dados corretamente';
    } else {
      //TODO BETTER ERROR HANDLER
      try {
        print(err.response);
        if (err.response != null && err.response!.data != null) {
          message = err.response!.data['message'];
        } else if (err.error != null) {
          message = err.message ?? "";
        } else {
          message = err.message ?? "";
        }
      } catch (e) {
        print(e);
        message = "Ocorreu um erro";
      }
    }
    return handler.reject(
        RequestException(message: message, options: err.requestOptions));
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    int? statusCode;
    try {
      statusCode = response.statusCode!;
      print("Response --> custom_interceptors --> statuscode: $statusCode");
      if (statusCode == 401) {
        handler.reject(RequestException(
          code: statusCode,
          options: response.requestOptions,
          message: 'Acesso não autorizado. '
              'Verifique as informações de login e tente novamente.',
        ));
      } else {
        print("Response --> another status code: $statusCode");
        print("Response --> Dados obtidos: ${response.data.toString()}");
      }
    } catch (e) {
      handler.reject(RequestException(
        options: response.requestOptions,
        code: statusCode,
        message: 'Erro',
      ));
    }
    final isSucess = statusCode! >= 200 && statusCode < 300;
    if (isSucess) {
      handler.next(response);
      // return super.onResponse(response);
    } else {
      print('${response.data}');
      handler.reject(RequestException(
          code: 500,
          message: 'Ocorreu um erro! - Code:500',
          options: response.requestOptions));
    }
  }
}
