abstract class Storage {
  Future<void> init();

  Future<String?> getString({required String key});

  Future<void> setString({required String key, required String value});

  Future<void> clear();
}
