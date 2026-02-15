import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006c08),
      surfaceTint: Color(0xff006e08),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00880d),
      onPrimaryContainer: Color(0xfff8fff1),
      secondary: Color(0xff3a6932),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffb7eea8),
      onSecondaryContainer: Color(0xff3e6e35),
      tertiary: Color(0xff005fa0),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff0078c9),
      onTertiaryContainer: Color(0xfffefcff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff5fced),
      onSurface: Color(0xff171d15),
      onSurfaceVariant: Color(0xff3f4a3a),
      outline: Color(0xff6f7b69),
      outlineVariant: Color(0xffbecab6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3229),
      inversePrimary: Color(0xff6ddf5f),
      primaryFixed: Color(0xff89fc78),
      onPrimaryFixed: Color(0xff002201),
      primaryFixedDim: Color(0xff6ddf5f),
      onPrimaryFixedVariant: Color(0xff005304),
      secondaryFixed: Color(0xffbaf1ab),
      onSecondaryFixed: Color(0xff002201),
      secondaryFixedDim: Color(0xff9fd491),
      onSecondaryFixedVariant: Color(0xff22511c),
      tertiaryFixed: Color(0xffd1e4ff),
      onTertiaryFixed: Color(0xff001d36),
      tertiaryFixedDim: Color(0xff9fcaff),
      onTertiaryFixedVariant: Color(0xff00497d),
      surfaceDim: Color(0xffd5dcce),
      surfaceBright: Color(0xfff5fced),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff6e7),
      surfaceContainer: Color(0xffe9f0e2),
      surfaceContainerHigh: Color(0xffe3ebdc),
      surfaceContainerHighest: Color(0xffdee5d6),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004003),
      surfaceTint: Color(0xff006e08),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff007f0b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff0f3f0c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff48783f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003862),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff0070bc),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fced),
      onSurface: Color(0xff0c130b),
      onSurfaceVariant: Color(0xff2e392a),
      outline: Color(0xff4a5645),
      outlineVariant: Color(0xff65705f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3229),
      inversePrimary: Color(0xff6ddf5f),
      primaryFixed: Color(0xff007f0b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006307),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff48783f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff305f29),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff0070bc),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005794),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c9bb),
      surfaceBright: Color(0xfff5fced),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff6e7),
      surfaceContainer: Color(0xffe3ebdc),
      surfaceContainerHigh: Color(0xffd8dfd1),
      surfaceContainerHighest: Color(0xffcdd4c6),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003502),
      surfaceTint: Color(0xff006e08),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005605),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff033403),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff24531e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002e51),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004b81),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fced),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff242f21),
      outlineVariant: Color(0xff414c3d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3229),
      inversePrimary: Color(0xff6ddf5f),
      primaryFixed: Color(0xff005605),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003c02),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff24531e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0b3b09),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004b81),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00345c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4bbad),
      surfaceBright: Color(0xfff5fced),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf3e4),
      surfaceContainer: Color(0xffdee5d6),
      surfaceContainerHigh: Color(0xffd0d7c9),
      surfaceContainerHighest: Color(0xffc2c9bb),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff6ddf5f),
      surfaceTint: Color(0xff6ddf5f),
      onPrimary: Color(0xff003a02),
      primaryContainer: Color(0xff00880d),
      onPrimaryContainer: Color(0xfff8fff1),
      secondary: Color(0xff9fd491),
      onSecondary: Color(0xff083907),
      secondaryContainer: Color(0xff22511c),
      onSecondaryContainer: Color(0xff8ec381),
      tertiary: Color(0xff9fcaff),
      onTertiary: Color(0xff003258),
      tertiaryContainer: Color(0xff0078c9),
      onTertiaryContainer: Color(0xfffefcff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f150d),
      onSurface: Color(0xffdee5d6),
      onSurfaceVariant: Color(0xffbecab6),
      outline: Color(0xff889482),
      outlineVariant: Color(0xff3f4a3a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee5d6),
      inversePrimary: Color(0xff006e08),
      primaryFixed: Color(0xff89fc78),
      onPrimaryFixed: Color(0xff002201),
      primaryFixedDim: Color(0xff6ddf5f),
      onPrimaryFixedVariant: Color(0xff005304),
      secondaryFixed: Color(0xffbaf1ab),
      onSecondaryFixed: Color(0xff002201),
      secondaryFixedDim: Color(0xff9fd491),
      onSecondaryFixedVariant: Color(0xff22511c),
      tertiaryFixed: Color(0xffd1e4ff),
      onTertiaryFixed: Color(0xff001d36),
      tertiaryFixedDim: Color(0xff9fcaff),
      onTertiaryFixedVariant: Color(0xff00497d),
      surfaceDim: Color(0xff0f150d),
      surfaceBright: Color(0xff343b31),
      surfaceContainerLowest: Color(0xff0a1008),
      surfaceContainerLow: Color(0xff171d15),
      surfaceContainer: Color(0xff1b2118),
      surfaceContainerHigh: Color(0xff252c22),
      surfaceContainerHighest: Color(0xff30372d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff83f672),
      surfaceTint: Color(0xff6ddf5f),
      onPrimary: Color(0xff002d01),
      primaryContainer: Color(0xff33a62d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb4eba5),
      onSecondary: Color(0xff002d01),
      secondaryContainer: Color(0xff6b9d5f),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc7deff),
      onTertiary: Color(0xff002747),
      tertiaryContainer: Color(0xff3c95e7),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f150d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4e0cb),
      outline: Color(0xffa9b6a2),
      outlineVariant: Color(0xff889481),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee5d6),
      inversePrimary: Color(0xff005505),
      primaryFixed: Color(0xff89fc78),
      onPrimaryFixed: Color(0xff001600),
      primaryFixedDim: Color(0xff6ddf5f),
      onPrimaryFixedVariant: Color(0xff004003),
      secondaryFixed: Color(0xffbaf1ab),
      onSecondaryFixed: Color(0xff001600),
      secondaryFixedDim: Color(0xff9fd491),
      onSecondaryFixedVariant: Color(0xff0f3f0c),
      tertiaryFixed: Color(0xffd1e4ff),
      onTertiaryFixed: Color(0xff001225),
      tertiaryFixedDim: Color(0xff9fcaff),
      onTertiaryFixedVariant: Color(0xff003862),
      surfaceDim: Color(0xff0f150d),
      surfaceBright: Color(0xff3f463c),
      surfaceContainerLowest: Color(0xff040903),
      surfaceContainerLow: Color(0xff191f16),
      surfaceContainer: Color(0xff232a20),
      surfaceContainerHigh: Color(0xff2e342b),
      surfaceContainerHighest: Color(0xff394035),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc7ffb6),
      surfaceTint: Color(0xff6ddf5f),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff69db5b),
      onPrimaryContainer: Color(0xff000f00),
      secondary: Color(0xffc7ffb7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff9bd08d),
      onSecondaryContainer: Color(0xff000f00),
      tertiary: Color(0xffe8f0ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff97c6ff),
      onTertiaryContainer: Color(0xff000c1b),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0f150d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe7f4de),
      outlineVariant: Color(0xffbac6b2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee5d6),
      inversePrimary: Color(0xff005505),
      primaryFixed: Color(0xff89fc78),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff6ddf5f),
      onPrimaryFixedVariant: Color(0xff001600),
      secondaryFixed: Color(0xffbaf1ab),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff9fd491),
      onSecondaryFixedVariant: Color(0xff001600),
      tertiaryFixed: Color(0xffd1e4ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff9fcaff),
      onTertiaryFixedVariant: Color(0xff001225),
      surfaceDim: Color(0xff0f150d),
      surfaceBright: Color(0xff4b5247),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2118),
      surfaceContainer: Color(0xff2c3229),
      surfaceContainerHigh: Color(0xff363d33),
      surfaceContainerHighest: Color(0xff42493e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
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
