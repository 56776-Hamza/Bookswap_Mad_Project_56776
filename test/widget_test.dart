import 'package:flutter_test/flutter_test.dart';
import 'package:bookswap/main.dart';

void main() {
  testWidgets('BookSwap App loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BookSwapApp());
    expect(find.text('BookSwap'), findsWidgets);
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
