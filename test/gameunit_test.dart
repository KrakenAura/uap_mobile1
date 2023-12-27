import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/game_page.dart';

void main() {
  testWidgets('Test buttonTapped method', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: GamePage()));

    // Reset initial state
    await tester.tap(find.byType(GamePage));
    await tester.pump();

    // Delay to allow the widget tree to rebuild
    await tester.pump();
    await Future.delayed(Duration(milliseconds: 100));

    // Debugging: Print widget tree details
    debugDumpRenderTree();

    // Check the initial state
    expect(find.text(''), findsOneWidget);

    // Tap the '1' button
    await tester.tap(find.text('1'));
    await tester.pump();

    // Check if the userAnswer is updated
    expect(find.text('1'), findsOneWidget);

    // Tap the '+' button
    await tester.tap(find.text('+'));
    await tester.pump();

    // Check if the operator is updated
    expect(find.text('1 +'), findsOneWidget);

    // Tap the '2' button
    await tester.tap(find.text('2'));
    await tester.pump();

    // Check if the userAnswer is updated
    expect(find.text('1 + 2'), findsOneWidget);

    // Tap the '=' button
    await tester.tap(find.text('='));
    await tester.pump();

    // Check the result
    expect(find.text('Correct!'), findsOneWidget);
  });
}
