// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_template/reducers/counter_reducer.dart';
import 'package:flutter_template/state/main_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import 'package:flutter_template/main.dart';

void main() {
  testWidgets('item add test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final store = Store<MainState>(counterReducer, initialState: MainState());
    await tester.pumpWidget(FlutterReduxApp(
      title: "test",
      store: store,
    ));

    // Verify that our counter starts at 0.
    expect(find.byIcon(Icons.flight_land), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    // Verify that our counter has incremented.
    expect(find.byIcon(Icons.flight_land), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.byIcon(Icons.flight_land), findsWidgets);
  });
}
