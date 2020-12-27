import 'package:flutter_template/state/entity/repo_info.dart';
import 'package:flutter_template/state/main_state.dart';

import '../actions/app_actions.dart';

MainState mainReducer(MainState state, dynamic action) {
  final appActions = action as AppActions;

  final newState = appActions.map(
    addItem: (AddItem _) => state.copyWith(
      repoInfoList: state.repoInfoList +
          [
            RepoInfo(
                repoName: "testName",
                repoOwner: "testOwner",
                repoDescription: "testDescription"),
          ],
    ),
  );

  return newState;
}
