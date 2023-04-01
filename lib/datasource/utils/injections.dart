import '../../injection_depency.dart';
import '../auth/data_source.dart';

void injeDepDataSourceAuth() {
  dependency.registerFactory<AuthDatasource>(() => AuthDatasourceIMP());
}
