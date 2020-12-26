import 'package:flutter_template/actions/app_actions.dart';
import 'package:flutter_template/reducers/counter_reducer.dart';
import 'package:flutter_template/state/main_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('counter_reducerの正常形', () {
    test('incrementアクションで値が1つ増えたstateが出力される', () {
      final state = MainState(itemList: []);
      final result = counterReducer(state, AppActions.addItem());
      expect(state, MainState(itemList: []));
      expect(result, MainState(itemList: ["test"]));
    });
  });
}
