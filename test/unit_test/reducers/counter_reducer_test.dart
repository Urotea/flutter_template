import 'package:flutter_template/actions/app_actions.dart';
import 'package:flutter_template/reducers/main_reducer.dart';
import 'package:flutter_template/state/entity/repo_info.dart';
import 'package:flutter_template/state/main_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('counter_reducerの正常形', () {
    test('incrementアクションで値が1つ増えたstateが出力される', () {
      final state = MainState(repoInfoList: []);
      final result = mainReducer(state, AppActions.addItem());
      expect(state, MainState(repoInfoList: []));
      expect(
          result,
          MainState(repoInfoList: [
            RepoInfo(
                repoName: "testName",
                repoOwner: "testOwner",
                repoDescription: "testDescription"),
          ]));
    });
  });
}
