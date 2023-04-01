import 'package:testelogin/entities/user/user.dart';

import '../../api/endpoint.dart';
import '../../api/request_result.dart';

abstract class AuthDatasource {
  Future<RequestResult> login({required String cpf});
}

class AuthDatasourceIMP implements AuthDatasource {
  @override
  Future<RequestResult> login({required String cpf}) async {
    final User user = User(client_id: cpf, cpf: cpf);
    final response = await EndPoint(
            method: Method.GET, url: 'authorize${user.paramsLoagin()}')
        .request();
    return response;
  }
}
