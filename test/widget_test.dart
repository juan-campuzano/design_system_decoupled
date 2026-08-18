import 'package:flutter_test/flutter_test.dart';

import 'package:design_system_decoupled/design_system/adaptive/adaptive_app.dart';
import 'package:design_system_decoupled/screens/gallery_screen.dart';

void main() {
  testWidgets('Gallery screen shows the platform-adaptive title', (tester) async {
    await tester.pumpWidget(
      const AdaptiveApp(title: 'Design System', home: GalleryScreen()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Design System'), findsOneWidget);
  });
}
