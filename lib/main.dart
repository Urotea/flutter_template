import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/container_widget/main_app.dart';
import 'package:flutter_template/middleware/app_actions_middleware.dart';
import 'package:flutter_template/state/main_state.dart';
import 'package:redux/redux.dart';

import 'middleware/dao/github_dao.dart';
import 'reducers/main_reducer.dart';

void main() {
  final AppActionsMiddleware appActionsMiddleware =
      AppActionsMiddleware(githubDao: GithubDao());

  final store = Store<MainState>(
    mainReducer,
    initialState: MainState(),
    middleware: [appActionsMiddleware.searchButtonTappedMiddleware],
  );

  runApp(FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<MainState> store;
  final String title;

  FlutterReduxApp({Key key, @required this.store, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return StoreProvider<MainState>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: store,
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
            appBarTheme: ThemeData.light().appBarTheme.copyWith(
                  color: Colors.white,
                )),
        title: title,
        home: MainApp(title: title),
      ),
    );
  }
}
