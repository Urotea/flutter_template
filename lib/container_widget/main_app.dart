import 'package:equatable/equatable.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/actions/app_actions.dart';
import 'package:flutter_template/presentational_widget/github_list/github_list.dart';
import 'package:flutter_template/presentational_widget/github_user_search/github_user_search.dart';
import 'package:flutter_template/presentational_widget/github_user_search/github_user_search_dao.dart';
import 'package:flutter_template/presentational_widget/stateless_textfield/stateless_textfield.dart';
import 'package:flutter_template/state/entity/repo_info.dart';
import 'package:flutter_template/state/main_state.dart';

class MainApp extends StatelessWidget {
  final String title;

  MainApp({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool enabled) => [
            SliverFloatingBar(
              title: StoreConnector<MainState, _HeaderArgs>(
                converter: (store) => _HeaderArgs(
                    headerText: store.state.searchWord,
                    searchCallback: (String str) =>
                        store.dispatch(AppActions.searchButtonTapped(str))),
                builder: (context, arg) => StatelessTextField(
                  initialValue: arg.headerText,
                  readOnly: true,
                  decoration: InputDecoration(hintText: "Search..."),
                  onTap: () async {
                    var result = await showSearch<String>(
                        context: context,
                        delegate: GithubUserSearch(dao: GithubUserSearchDao()));
                    if (result != null) {
                      arg.searchCallback(result);
                    }
                  },
                ),
              ),
            ),
          ],
          body: StoreConnector<MainState, _BodyArgs>(
              converter: (store) =>
                  _BodyArgs(repoList: store.state.repoInfoList),
              builder: (context, arg) =>
                  GithubList(repoInfoList: arg.repoList)),
        ),
      ),
    );
  }
}

class _HeaderArgs extends Equatable {
  final Function(String) searchCallback;
  final String headerText;

  _HeaderArgs({this.headerText: "", @required this.searchCallback})
      : assert(searchCallback != null);

  @override
  List<Object> get props => [headerText, searchCallback];
}

class _BodyArgs extends Equatable {
  final List<RepoInfo> repoList;

  _BodyArgs({@required this.repoList}) : assert(repoList != null);

  @override
  List<Object> get props => [repoList];
}
