import 'package:flutter/foundation.dart';

/// Whether the running platform should render with Cupertino-style widgets.
///
/// This is the single decision point the whole design system branches on:
/// every `Adaptive*` widget calls this instead of checking
/// `defaultTargetPlatform` itself.
bool get isApplePlatform {
  switch (defaultTargetPlatform) {
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return true;
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return false;
  }
}
