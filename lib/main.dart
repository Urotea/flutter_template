import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_notifier/state_notifier.dart';

void main() {
  runApp(
    ProviderScope(
      child: CounterApp(),
    ),
  );
}

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}

// Note: CounterApp is a HookWidget, from flutter_hooks.
class CounterApp extends HookWidget {
  final counterProvider = StateNotifierProvider((_) => Counter());

  @override
  Widget build(BuildContext context) {
    final state = useProvider(counterProvider.state);
    final counter = useProvider(counterProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('CounterApp')),
        body: Center(
          child: Text(state.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:() => counter.increment(),
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

