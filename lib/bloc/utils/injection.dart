import 'package:testelogin/injection_depency.dart';

import '../auth/auth_bloc.dart';

void injeDepAuthBloc() {
  dependency.registerFactory(() => AuthBloc(authRepository: dependency()));
}
