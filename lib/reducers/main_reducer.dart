import 'package:flutter_template/state/entity/repo_info.dart';
import 'package:flutter_template/state/main_state.dart';

import '../actions/app_actions.dart';

MainState mainReducer(MainState state, dynamic action) {
  final appActions = action as AppActions;

  final newState = appActions.map(
    searchButtonTapped: (SearchButtonTapped action) => state.copyWith(
      searchWord: action.owner,
    ),
    repositoryReceived: (RepositoryReceived action) => state.copyWith(
        repoInfoList: action.repos
            .map((repo) => RepoInfo(
                repoName: repo.name,
                repoOwner: repo.owner.login,
                repoDescription: repo.description ?? ""))
            .toList()),
  );

  return newState;
}
