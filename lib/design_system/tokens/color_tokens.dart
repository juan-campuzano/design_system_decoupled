import 'dart:ui' show Color;

/// Brand color tokens, independent of any Material/Cupertino widget package.
///
/// [AppColors] is the single source of truth: both the Material and
/// Cupertino theme builders (see `theme/app_theme.dart`) read from here, so
/// changing a token here updates both platform renderings at once.
class AppColors {
  const AppColors._();

  static const Color seed = Color(0xFF3D5AFE);
  static const Color success = Color(0xFF2E7D32);
  static const Color danger = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFED6C02);

  static const Color surfaceLight = Color(0xFFFAFAFC);
  static const Color surfaceDark = Color(0xFF121214);
}
