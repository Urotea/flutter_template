import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/actions/app_actions.dart';
import 'package:flutter_template/state/entity/repo_info.dart';
import 'package:flutter_template/state/main_state.dart';

import '../presentational_widget/github_list.dart';

class MainApp extends StatelessWidget {
  final String title;

  MainApp({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: StoreConnector<MainState, List<RepoInfo>>(converter: (store) {
          return store.state.repoInfoList;
        }, builder: (context, repoInfoList) {
          return GithubList(
            repoInfoList: repoInfoList,
          );
        }),
        floatingActionButton: StoreConnector<MainState, VoidCallback>(
          converter: (store) {
            // Return a `VoidCallback`, which is a fancy name for a function
            // with no parameters. It only dispatches an Increment action.
            return () =>
                store.dispatch(AppActions.searchButtonTapped("Urotea"));
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
