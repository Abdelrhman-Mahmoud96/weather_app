import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  const SharedPreferenceHelper({
    required this.plugin,
  });

  final SharedPreferences plugin;

  String? getValue(String key) {
    return plugin.getString(key);
  }

  Future<void> setValue(String key, String value) async {
    await plugin.setString(key, value);
  }

  Future<void> deleteValue(String key) async {
    await plugin.remove(key);
  }

  Set<String> getKeys() {
    return plugin.getKeys().where((key) => key != 'locations').toSet();
  }
}
