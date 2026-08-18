import 'package:cupertino_ui/cupertino_ui.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' as material;

import 'target.dart';

/// A primary action button: [material.FilledButton] on Material,
/// a filled [cupertino.CupertinoButton] on Cupertino.
class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (isApplePlatform) {
      return cupertino.CupertinoButton.filled(
        onPressed: onPressed,
        child: Text(label),
      );
    }
    return material.FilledButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
