import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/utils/theme_state.dart';

class ThemeStateProvider extends ChangeNotifier {
  ThemeState _themeState = ThemeState.system;

  ThemeState get themeState => _themeState;

  ThemeMode get currentThemeMode {
    switch (_themeState) {
      case ThemeState.dark:
        return ThemeMode.dark;
      case ThemeState.light:
        return ThemeMode.light;
      case ThemeState.system:
        return ThemeMode.system;
    }
  }

  set themeState(ThemeState value) {
    _themeState = value;
    notifyListeners();
  }
}
