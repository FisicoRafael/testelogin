import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/custom_interceptors.dart';
import 'bloc/utils/injection.dart';
import 'datasource/utils/injections.dart';
import 'repository/utils/injection.dart';
import 'storage/storage_local.dart';
import 'storage/storage_local_imp.dart';

final dependency = GetIt.instance;

void initInjectionDependency() async {
  injeDepAuthBloc();
  injeDepDataSourceAuth();
  injeDepRepoAuth();
  dependency.registerFactory(() => CustomInterceptors(
      internetConnectionChecker: dependency(), storageLocal: dependency()));
  dependency.registerFactory(
    () => InternetConnectionChecker(),
  );
  dependency.registerFactory<StorageLocal>(
      () => StorageLocalIMP(sharedPreferences: dependency()));
  dependency.registerFactory(() => SharedPreferences.getInstance());
}
