import 'package:shared_preferences/shared_preferences.dart';
import 'package:who_are_you/data/storage/storage.dart';

class SharedPrefStorage implements Storage {
  late final SharedPreferences preferences;

  SharedPrefStorage();

  @override
  Future<String?> getString({required String key}) async {
    return preferences.getString(key);
  }

  @override
  Future<bool> setString({required String key, required String value}) async {
    return preferences.setString(key, value);
  }

  @override
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }
}
