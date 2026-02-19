import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF00BC7D),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFB6F5DC),
      onPrimaryContainer: Color(0xFF003D28),
      surfaceTint: Color(0xFF00BC7D),
      secondary: Color(0xFF4C6359),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFCEE9DB),
      onSecondaryContainer: Color(0xFF092018),
      tertiary: Color(0xFF3A6472),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFBDE9FA),
      onTertiaryContainer: Color(0xFF001F28),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF93000A),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF111411),
      onSurfaceVariant: Color(0xFF3E4841),
      outline: Color(0xFF6E7871),
      outlineVariant: Color(0xFFBEC8C0),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF1A1F1C),
      inversePrimary: Color(0xFF5DDFAA),
      surfaceDim: Color(0xFFDCDCDC),
      surfaceBright: Color(0xFFFFFFFF),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF7F7F7),
      surfaceContainer: Color(0xFFF2F2F2),
      surfaceContainerHigh: Color(0xFFECECEC),
      surfaceContainerHighest: Color(0xFFE6E6E6),
      primaryFixed: Color(0xFFB6F5DC),
      onPrimaryFixed: Color(0xFF002114),
      primaryFixedDim: Color(0xFF5DDFAA),
      onPrimaryFixedVariant: Color(0xFF007A52),
      secondaryFixed: Color(0xFFCEE9DB),
      onSecondaryFixed: Color(0xFF092018),
      secondaryFixedDim: Color(0xFFB2CDBF),
      onSecondaryFixedVariant: Color(0xFF344C42),
      tertiaryFixed: Color(0xFFBDE9FA),
      onTertiaryFixed: Color(0xFF001F28),
      tertiaryFixedDim: Color(0xFFA2CDDD),
      onTertiaryFixedVariant: Color(0xFF224B59),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,

      primary: Color(0xFF5DDFAA),
      onPrimary: Color(0xFF003822),
      primaryContainer: Color(0xFF007A52),
      onPrimaryContainer: Color(0xFFB6F5DC),
      surfaceTint: Color(0xFF5DDFAA),
      secondary: Color(0xFFB2CDBF),
      onSecondary: Color(0xFF1E3329),
      secondaryContainer: Color(0xFF344C42),
      onSecondaryContainer: Color(0xFFCEE9DB),
      tertiary: Color(0xFFA2CDDD),
      onTertiary: Color(0xFF053542),
      tertiaryContainer: Color(0xFF224B59),
      onTertiaryContainer: Color(0xFFBDE9FA),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: Color(0xFF0D0D0D),
      onSurface: Color(0xFFE2E2E2),
      onSurfaceVariant: Color(0xFFBEC8C0),
      outline: Color(0xFF89928B),
      outlineVariant: Color(0xFF3E4841),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE2E2E2),
      inversePrimary: Color(0xFF00BC7D),
      surfaceDim: Color(0xFF0D0D0D),
      surfaceBright: Color(0xFF2E2E2E),
      surfaceContainerLowest: Color(0xFF080808),
      surfaceContainerLow: Color(0xFF141414),
      surfaceContainer: Color(0xFF1A1A1A),
      surfaceContainerHigh: Color(0xFF222222),
      surfaceContainerHighest: Color(0xFF2A2A2A),
      primaryFixed: Color(0xFFB6F5DC),
      onPrimaryFixed: Color(0xFF002114),
      primaryFixedDim: Color(0xFF5DDFAA),
      onPrimaryFixedVariant: Color(0xFF007A52),
      secondaryFixed: Color(0xFFCEE9DB),
      onSecondaryFixed: Color(0xFF092018),
      secondaryFixedDim: Color(0xFFB2CDBF),
      onSecondaryFixedVariant: Color(0xFF344C42),
      tertiaryFixed: Color(0xFFBDE9FA),
      onTertiaryFixed: Color(0xFF001F28),
      tertiaryFixedDim: Color(0xFFA2CDDD),
      onTertiaryFixedVariant: Color(0xFF224B59),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,

        cardTheme: CardThemeData(
          color: colorScheme.surfaceContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        iconTheme: IconThemeData(color: colorScheme.onSurface),
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}