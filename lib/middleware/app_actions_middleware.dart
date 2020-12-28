import 'package:flutter/cupertino.dart';
import 'package:flutter_template/actions/app_actions.dart';
import 'package:flutter_template/state/main_state.dart';
import 'package:redux/redux.dart';

import 'dao/github_dao.dart';

class AppActionsMiddleware {
  final GithubDao githubDao;

  AppActionsMiddleware({@required this.githubDao});

  void searchButtonTappedMiddleware(
      Store<MainState> store, dynamic action, NextDispatcher next) {
    if (action is! SearchButtonTapped) {
      next(action);
      return;
    }

    next(action);
    var a = action as SearchButtonTapped;

    this.githubDao.fetchRepositories(a.owner).then((result) => result.when(
          ok: (repos) => store.dispatch(AppActions.repositoryReceived(repos)),
          err: (e) {
            // 失敗したときの処理を書く。
            print(e);
          },
        ));
  }
}
