import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveCache(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String?> getCache(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<void> clearCache(String key) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}
