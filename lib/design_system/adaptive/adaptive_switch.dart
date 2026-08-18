import 'package:cupertino_ui/cupertino_ui.dart' as cupertino;
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' as material;

import 'target.dart';

/// [material.Switch] on Material, [cupertino.CupertinoSwitch] on Cupertino.
class AdaptiveSwitch extends StatelessWidget {
  const AdaptiveSwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    if (isApplePlatform) {
      return cupertino.CupertinoSwitch(value: value, onChanged: onChanged);
    }
    return material.Switch(value: value, onChanged: onChanged);
  }
}
