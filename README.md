# design_system_decoupled

Example repo for the article on decoupling Material and Cupertino from
Flutter's core. Instead of `package:flutter/material.dart` and
`package:flutter/cupertino.dart`, this app depends on the two standalone
packages that now ship those widget sets separately:

- [`material_ui`](https://pub.dev/packages/material_ui) — Material Design
  widgets, decoupled from Flutter core.
- [`cupertino_ui`](https://pub.dev/packages/cupertino_ui) — Cupertino (HIG)
  widgets, decoupled from Flutter core.

Both are 1:1 API ports of the widgets that used to live in the framework
(same class names — `ThemeData`, `Scaffold`, `CupertinoApp`, etc.) but now
version and ship independently of the Flutter SDK.

## What this demonstrates

A single **adaptive design system** built on top of both packages:

```
lib/
  design_system/
    tokens/       # plain-Dart color, spacing, radius, and type-scale tokens
                   # with no dependency on material_ui or cupertino_ui
    theme/         # app_theme.dart converts the tokens into a material_ui
                   # ThemeData and a cupertino_ui CupertinoThemeData
    adaptive/      # AdaptiveApp, AdaptiveScaffold, AdaptiveButton, etc. —
                   # each one picks material_ui or cupertino_ui at runtime
                   # based on `isApplePlatform` (target.dart)
  screens/
    gallery_screen.dart   # demo screen built only from Adaptive* widgets —
                           # it never imports material_ui or cupertino_ui
                           # directly
```

The design tokens are the single source of truth. Change a color or spacing
value once in `design_system/tokens/`, and both the Material (Android/
desktop/web) and Cupertino (iOS/macOS) renderings pick it up — because
`buildMaterialTheme()` and `buildCupertinoTheme()` both read from the same
tokens.

The `Adaptive*` widgets are the only place that decides which package to
render with, via `isApplePlatform` in `design_system/adaptive/target.dart`.
Screens are written once against the `Adaptive*` API and never branch on
platform themselves.

## Running

```bash
flutter pub get
flutter run -d macos    # or: -d chrome, ios, android, windows, linux
```

On macOS/iOS you'll see the Cupertino rendering (`cupertino_ui`); everywhere
else you'll see Material (`material_ui`).

## Notes on the decoupling

- Both packages still depend on Flutter's core framework
  (`flutter/widgets.dart`, `flutter/foundation.dart`) — only the
  *design-system-specific* widgets (buttons, scaffolds, themes, etc.) were
  pulled out, not core primitives like `Widget`, `TextStyle`, or `Color`.
- `material_ui` depends on `cupertino_ui` internally (for adaptive fallback
  icons/behavior), but `cupertino_ui` has no dependency on `material_ui`.
- For migrating an existing app rather than starting fresh, both packages
  ship a `dart fix --apply --code=migrate_design_widgets` fixer and a
  compatibility bridge (`MaterialUiCompatibilityBridge` /
  `CupertinoUiCompatibilityBridge`) for dependencies that still import the
  old `package:flutter/material.dart` / `package:flutter/cupertino.dart`.
