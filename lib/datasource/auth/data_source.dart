import 'package:testelogin/entities/user/user.dart';

import '../../api/endpoint.dart';
import '../../api/request_result.dart';

abstract class AuthDatasource {
  Future<RequestResult> login({required String cpf});
}

class AuthDatasourceIMP implements AuthDatasource {
  @override
  Future<RequestResult> login({required String cpf}) async {
    print("Pegou DataAuth: $cpf");
    User user = User(client_id: cpf, cpf: cpf);
    print("Pegou DataAuth: ${user.paramsLoagin()}");
    final response = await EndPoint(
            method: Method.GET, url: 'authorize${user.paramsLoagin()}')
        .request();
    return response;
  }
}
