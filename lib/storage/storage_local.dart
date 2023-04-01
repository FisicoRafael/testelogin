abstract class StorageLocal {
  Future<void> setToken({required String token});

  Future<String> getToken();
}
