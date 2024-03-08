// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_113/model/task/task_model.dart';
import 'package:flutter_113/view/screens/auth/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_113/main.dart';

void main() {
  test('Test on Object', () {
    final Task task = Task(
      id: 1,
      title: 'title',
      description: 'description',
      startDate: 'startDate',
    );

    expect(task.id, 1);
    expect(task.title, 'title');
    expect(task.description, 'description');
    expect(task.startDate, 'startDate');
  });

  test('description', () {
    expect(1, 1);
  });


  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LoginScreen());

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byIcon(Icons.visibility_rounded), findsOneWidget);
    // expect(find.text('1'), findsOneWidget);
  });
}
