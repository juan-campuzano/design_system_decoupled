import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:material_ui/material_ui.dart';

import '../tokens/color_tokens.dart';
import '../tokens/typography_tokens.dart';

FontWeight _weight(FontWeightToken token) {
  switch (token) {
    case FontWeightToken.regular:
      return FontWeight.w400;
    case FontWeightToken.medium:
      return FontWeight.w500;
    case FontWeightToken.semiBold:
      return FontWeight.w600;
    case FontWeightToken.bold:
      return FontWeight.w700;
  }
}

TextStyle _textStyle(TypeStyle style, {required Color color}) {
  return TextStyle(
    fontSize: style.fontSize,
    fontWeight: _weight(style.fontWeight),
    letterSpacing: style.letterSpacing,
    color: color,
  );
}

/// Builds a `material_ui` [ThemeData] from the shared design tokens.
ThemeData buildMaterialTheme(Brightness brightness) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.seed,
    brightness: brightness,
  );
  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: brightness == Brightness.light
        ? AppColors.surfaceLight
        : AppColors.surfaceDark,
    textTheme: TextTheme(
      displayLarge: _textStyle(AppTypography.displayLarge, color: colorScheme.onSurface),
      titleLarge: _textStyle(AppTypography.titleLarge, color: colorScheme.onSurface),
      titleMedium: _textStyle(AppTypography.titleMedium, color: colorScheme.onSurface),
      bodyMedium: _textStyle(AppTypography.body, color: colorScheme.onSurface),
      bodySmall: _textStyle(AppTypography.caption, color: colorScheme.onSurfaceVariant),
    ),
  );
}

/// Builds a `cupertino_ui` [CupertinoThemeData] from the same tokens.
CupertinoThemeData buildCupertinoTheme(Brightness brightness) {
  final onSurface = brightness == Brightness.light
      ? CupertinoColors.label
      : CupertinoColors.white;
  return CupertinoThemeData(
    brightness: brightness,
    primaryColor: AppColors.seed,
    scaffoldBackgroundColor: brightness == Brightness.light
        ? AppColors.surfaceLight
        : AppColors.surfaceDark,
    textTheme: CupertinoTextThemeData(
      primaryColor: AppColors.seed,
      navTitleTextStyle: _textStyle(AppTypography.titleLarge, color: onSurface),
      textStyle: _textStyle(AppTypography.body, color: onSurface),
    ),
  );
}
