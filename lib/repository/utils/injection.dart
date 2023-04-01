import '../../injection_depency.dart';
import '../user/auth.dart';

void injeDepRepoAuth() {
  dependency.registerFactory<AuthRepository>(
      () => AuthRepositoryIMP(authDatasource: dependency()));
}
