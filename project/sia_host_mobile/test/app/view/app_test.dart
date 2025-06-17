import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sia_host_mobile/src/modules/app/views/pages/app.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(Center), findsOneWidget);
    });
  });
}
