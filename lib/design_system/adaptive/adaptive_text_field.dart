import 'package:cupertino_ui/cupertino_ui.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' as material;

import '../tokens/spacing_tokens.dart';
import 'target.dart';

/// [material.TextField] with an outline border on Material,
/// [cupertino.CupertinoTextField] with a rounded border on Cupertino.
class AdaptiveTextField extends StatelessWidget {
  const AdaptiveTextField({
    super.key,
    required this.controller,
    required this.placeholder,
  });

  final TextEditingController controller;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    if (isApplePlatform) {
      return cupertino.CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        padding: const EdgeInsets.all(AppSpacing.sm + AppSpacing.xs),
        decoration: BoxDecoration(
          border: Border.all(color: cupertino.CupertinoColors.systemGrey3),
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
      );
    }
    return material.TextField(
      controller: controller,
      decoration: material.InputDecoration(
        hintText: placeholder,
        border: material.OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
      ),
    );
  }
}
