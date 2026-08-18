import 'package:flutter/widgets.dart' show runApp;

import 'design_system/adaptive/adaptive_app.dart';
import 'screens/gallery_screen.dart';

void main() {
  runApp(const AdaptiveApp(title: 'Design System', home: GalleryScreen()));
}
