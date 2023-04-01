import 'package:shared_preferences/shared_preferences.dart';

import 'storage_local.dart';

class StorageLocalIMP implements StorageLocal {
  final SharedPreferences sharedPreferences;

  StorageLocalIMP({required this.sharedPreferences});

  final String _token = "token";

  @override
  Future<String> getToken() async {
    return sharedPreferences.getString(_token) ?? "";
  }

  @override
  Future<void> setToken({required String token}) async {
    await sharedPreferences.setString(_token, token);
  }
}
