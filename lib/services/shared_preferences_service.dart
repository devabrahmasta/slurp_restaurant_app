import 'package:shared_preferences/shared_preferences.dart';
import 'package:slurp_restaurant_app/data/model/setting.dart';
import 'package:slurp_restaurant_app/utils/theme_state.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  static const String _keyTheme = "MY_THEME";
  static const String _keyReminder = "DAILY_REMINDER";

  // Theme
  Future<void> saveSettingValue(Setting setting) async {
    try {
      await _preferences.setString(_keyTheme, setting.screenTheme);
    } catch (e) {
      throw Exception("Shared preferences cannot save the setting value.");
    }
  }

  Setting getSettingValue() {
    return Setting(
      screenTheme: _preferences.getString(_keyTheme) ?? ThemeState.system.name,
    );
  }

  // Notification Reminder
  Future<void> saveReminderValue(bool value) async {
    await _preferences.setBool(_keyReminder, value);
  }

  bool getReminderValue() {
    return _preferences.getBool(_keyReminder) ?? false;
  }
}
