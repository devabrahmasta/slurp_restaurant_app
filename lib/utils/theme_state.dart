enum ThemeState { system, light, dark }

extension ThemeStateExtension on String {
  ThemeState toThemeState() {
    return ThemeState.values.firstWhere(
      (e) => e.name == this,
      orElse: () => ThemeState.system,
    );
  }
}
