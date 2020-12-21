import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/actions/app_actions.dart';
import 'package:flutter_template/state/main_state.dart';

class MainApp extends StatelessWidget {
  final String title;
  MainApp({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
                key: Key("contents"),
              ),
              StoreConnector<MainState, String>(
                converter: (store) => store.state.count.toString(),
                builder: (context, count) {
                  return Text(
                    count,
                    key: Key("counter"),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: StoreConnector<MainState, VoidCallback>(
          converter: (store) {
            // Return a `VoidCallback`, which is a fancy name for a function
            // with no parameters. It only dispatches an Increment action.
            return () => store.dispatch(AppActions.increment());
          },
          builder: (context, callback) {
            return FloatingActionButton(
              onPressed: callback,
              tooltip: 'asdasdasd',
              key: Key("increment"),
              child: Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
