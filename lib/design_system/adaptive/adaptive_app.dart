import 'package:cupertino_ui/cupertino_ui.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' as material;

import '../theme/app_theme.dart';
import 'target.dart';

/// Root app widget. Renders a `material_ui` [material.MaterialApp] on
/// Android/desktop/web and a `cupertino_ui` [cupertino.CupertinoApp] on
/// iOS/macOS, both built from the same [buildMaterialTheme] /
/// [buildCupertinoTheme] token functions.
class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({
    super.key,
    required this.title,
    required this.home,
    this.brightness = Brightness.light,
  });

  final String title;
  final Widget home;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    if (isApplePlatform) {
      return cupertino.CupertinoApp(
        title: title,
        theme: buildCupertinoTheme(brightness),
        localizationsDelegates: cupertino.GlobalCupertinoLocalizations.delegates,
        home: home,
      );
    }
    return material.MaterialApp(
      title: title,
      theme: buildMaterialTheme(brightness),
      localizationsDelegates: material.GlobalMaterialLocalizations.delegates,
      home: home,
    );
  }
}
