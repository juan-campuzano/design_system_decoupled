import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/widgets.dart';

import '../design_system/adaptive/adaptive_button.dart';
import '../design_system/adaptive/adaptive_dialog.dart';
import '../design_system/adaptive/adaptive_scaffold.dart';
import '../design_system/adaptive/adaptive_switch.dart';
import '../design_system/adaptive/adaptive_text_field.dart';
import '../design_system/adaptive/target.dart';
import '../design_system/tokens/spacing_tokens.dart';

/// Demo screen: the same widget tree renders with `material_ui` or
/// `cupertino_ui` underneath depending on platform, driven entirely by the
/// `Adaptive*` widgets — this screen never imports either package directly.
class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  bool _notificationsEnabled = true;
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: 'Design System',
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Rendering as: ${kIsWeb ? 'web' : defaultTargetPlatform.name} '
              '(${isApplePlatform ? 'cupertino_ui' : 'material_ui'})',
            ),
            const SizedBox(height: AppSpacing.lg),
            AdaptiveTextField(
              controller: _nameController,
              placeholder: 'Your name',
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Enable notifications'),
                AdaptiveSwitch(
                  value: _notificationsEnabled,
                  onChanged: (value) => setState(() => _notificationsEnabled = value),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            AdaptiveButton(
              label: 'Show dialog',
              onPressed: () => showAdaptiveDialog(
                context: context,
                title: 'Hello',
                message: _nameController.text.isEmpty
                    ? 'Same tokens, native widgets on each platform.'
                    : 'Hi, ${_nameController.text}! Same tokens, native widgets.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
