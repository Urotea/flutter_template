import 'package:flutter_template/actions/app_actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter_template/state/main_state.dart';

void addItemMiddleware(Store<MainState> store, dynamic action, NextDispatcher next) {
  if(action is! AddItem) {
    next(action);
    return;
  }

  // TODO: useCaseをここに書く
  next(action);
}
