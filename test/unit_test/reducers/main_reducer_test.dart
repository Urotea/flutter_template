import 'package:flutter_template/actions/app_actions.dart';
import 'package:flutter_template/middleware/dao/entity/owner.dart';
import 'package:flutter_template/middleware/dao/entity/repository.dart';
import 'package:flutter_template/reducers/main_reducer.dart';
import 'package:flutter_template/state/main_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('searchButtonTappedの正常形', () {
    test('stateが変化しない', () {
      final state = MainState(repoInfoList: []);
      final result = mainReducer(state, AppActions.searchButtonTapped("test"));
      expect(result, MainState(searchWord: "test", repoInfoList: []));
    });
  });

  group('repositoryReceivedの正常形', () {
    test('stateのrepoListがactionのpayloadに変化する', () {
      final state = MainState(repoInfoList: []);
      final result = mainReducer(
          state,
          AppActions.repositoryReceived([
            Repository(
                name: "test",
                owner: Owner(login: "user"),
                description: "description")
          ]));
      expect(result.repoInfoList.length, 1);
      expect(
        result.repoInfoList[0].repoName,
        "test",
      );
      expect(
        result.repoInfoList[0].repoOwner,
        "user",
      );
      expect(
        result.repoInfoList[0].repoDescription,
        "description",
      );
    });
  });
}
