import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/test_2/view/calculator_page.dart';

void main() {
  testWidgets("Calculator page smoke test", (WidgetTester tester) async {
    // Build widget to test for
    await tester.pumpWidget(const MaterialApp(
      home: CalculatorPage(),
    ));

    // Test the widget built
    expect(find.text("Result"), findsOneWidget);
    expect(find.text("+"), findsOneWidget);
    expect(find.text("-"), findsOneWidget);
    expect(find.text("*"), findsOneWidget);
    expect(find.text("/"), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));

    // testing when buttons are pressed
    // entering values to text field.

    await tester.enterText(find.byKey(const ValueKey("firstOperand")), "10");

    await tester.enterText(find.byKey(const ValueKey("secondOperand")), "10");

    await tester.tap(find.text("+"));
    await tester.pump();
    expect(find.text("20.0"), findsOneWidget);

    await tester.tap(find.text("-"));
    await tester.pump();
    expect(find.text("0.0"), findsOneWidget);
  });
}
