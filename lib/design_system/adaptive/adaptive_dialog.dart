import 'package:cupertino_ui/cupertino_ui.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' as material;

import 'target.dart';

/// Shows [material.AlertDialog] via [material.showDialog] on Material,
/// or [cupertino.CupertinoAlertDialog] via [cupertino.showCupertinoDialog]
/// on Cupertino.
Future<void> showAdaptiveDialog({
  required BuildContext context,
  required String title,
  required String message,
}) {
  if (isApplePlatform) {
    return cupertino.showCupertinoDialog<void>(
      context: context,
      builder: (context) => cupertino.CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          cupertino.CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  return material.showDialog<void>(
    context: context,
    builder: (context) => material.AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        material.TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
