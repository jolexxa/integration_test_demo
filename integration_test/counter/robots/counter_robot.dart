import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_demo/app/app.dart';
import 'package:integration_test_demo/counter/counter.dart';

class CounterRobot {
  CounterRobot({required this.tester});

  final WidgetTester tester;

  Future<void> goToCounterFeature() async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
  }

  Future<void> tapIncrementButton() async {
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
  }

  Future<int> readNumber() async {
    final text = tester
        .widget<Text>(
          find.descendant(
            of: find.byType(CounterText),
            matching: find.byType(Text),
          ),
        )
        .data;
    return text == null ? 0 : int.parse(text);
  }

  Future<void> tapDecrementButton() async {
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle();
  }
}
