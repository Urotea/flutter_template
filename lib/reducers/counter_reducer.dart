import 'package:flutter_template/state/main_state.dart';

import '../actions/app_actions.dart';

MainState counterReducer(MainState state, dynamic action) {
  final appActions = action as AppActions;

  final newState = appActions.map(
    addItem: (AddItem _) => state.copyWith(itemList: state.itemList + ["test"]),
  );

  return newState;
}
