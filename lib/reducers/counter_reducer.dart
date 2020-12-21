import 'package:flutter_template/state/main_state.dart';

import '../actions/app_actions.dart';

MainState counterReducer(MainState state, dynamic action) {
  final appActions = action as AppActions;

  final newState = appActions.map(
    increment: (Increment _) => state.copyWith(count: state.count + 1),
  );

  return newState;
}
