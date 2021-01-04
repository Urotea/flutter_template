import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/actions/app_actions.dart';
import 'package:flutter_template/container_widget/search_delegate.dart';
import 'package:flutter_template/presentational_widget/github_list.dart';
import 'package:flutter_template/state/entity/repo_info.dart';
import 'package:flutter_template/state/main_state.dart';

class MainApp extends StatelessWidget {
  final String title;

  MainApp({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      body: StoreConnector<MainState, List<RepoInfo>>(converter: (store) {
        return store.state.repoInfoList;
      }, builder: (context, repoInfoList) {
        return SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool enabled) => [
                    SliverFloatingBar(
                      title: TextField(
                        readOnly: true,
                        decoration: InputDecoration(hintText: "Search..."),
                        onTap: () => showSearch(context: context, delegate: MySearchDelegate()),
                      ),
                    ),
                  ],
              body: GithubList(repoInfoList: repoInfoList)),
        );
      }),
      floatingActionButton: StoreConnector<MainState, VoidCallback>(
        converter: (store) {
          // Return a `VoidCallback`, which is a fancy name for a function
          // with no parameters. It only dispatches an Increment action.
          return () => store.dispatch(AppActions.searchButtonTapped("Urotea"));
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: callback,
            tooltip: 'increment',
            key: Key("increment"),
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
