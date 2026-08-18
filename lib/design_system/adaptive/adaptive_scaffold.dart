import 'package:cupertino_ui/cupertino_ui.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' as material;

import 'target.dart';

/// A page scaffold with a title bar, rendered as [material.Scaffold] +
/// [material.AppBar] or [cupertino.CupertinoPageScaffold] +
/// [cupertino.CupertinoNavigationBar] depending on platform.
class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({super.key, required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    if (isApplePlatform) {
      return cupertino.CupertinoPageScaffold(
        navigationBar: cupertino.CupertinoNavigationBar(middle: Text(title)),
        child: SafeArea(child: body),
      );
    }
    return material.Scaffold(
      appBar: material.AppBar(title: Text(title)),
      body: SafeArea(child: body),
    );
  }
}
