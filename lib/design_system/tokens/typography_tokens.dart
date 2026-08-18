/// Plain-data type scale. Deliberately has no dependency on `TextStyle`
/// from either UI package, so it can be converted into a Material
/// `TextTheme` and a Cupertino `CupertinoTextThemeData` from one definition.
class TypeStyle {
  const TypeStyle({
    required this.fontSize,
    required this.fontWeight,
    this.letterSpacing = 0,
  });

  final double fontSize;
  final FontWeightToken fontWeight;
  final double letterSpacing;
}

enum FontWeightToken { regular, medium, semiBold, bold }

class AppTypography {
  const AppTypography._();

  static const TypeStyle displayLarge = TypeStyle(
    fontSize: 34,
    fontWeight: FontWeightToken.bold,
    letterSpacing: -0.5,
  );
  static const TypeStyle titleLarge = TypeStyle(
    fontSize: 22,
    fontWeight: FontWeightToken.semiBold,
  );
  static const TypeStyle titleMedium = TypeStyle(
    fontSize: 17,
    fontWeight: FontWeightToken.medium,
  );
  static const TypeStyle body = TypeStyle(
    fontSize: 15,
    fontWeight: FontWeightToken.regular,
  );
  static const TypeStyle caption = TypeStyle(
    fontSize: 12,
    fontWeight: FontWeightToken.regular,
    letterSpacing: 0.2,
  );
}
