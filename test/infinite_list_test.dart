import "package:flutter_test/flutter_test.dart";
import '../lib/base/infinite_list.dart';

void main() {
  testWidgets('infinite', (WidgetTester tester) async {
    await tester.pumpWidget(Homeful());

    await tester.fling(find.bySemanticsLabel('3'), const Offset(100.0, 0.0), 800.0);
    await tester.pumpAndSettle();
    expect(log, isEmpty);

  });
}
