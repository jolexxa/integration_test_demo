import 'package:flutter_test/flutter_test.dart';

import 'robots/counter_robot.dart';

void main() {
  group('counter app', () {
    testWidgets('counts up and down', (tester) async {
      final robot = CounterRobot(tester: tester);
      await robot.goToCounterFeature();
      await robot.tapIncrementButton();
      await expectLater(robot.readNumber(), completion(equals(1)));
      await robot.tapDecrementButton();
      await expectLater(robot.readNumber(), completion(equals(0)));
    });
  });
}
