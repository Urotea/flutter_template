import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'entity/repo_info.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default("") String searchWord,
    @Default([]) List<RepoInfo> repoInfoList,
  }) = _MainState;
}
