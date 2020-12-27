import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'repo_info.freezed.dart';

@freezed
abstract class RepoInfo with _$RepoInfo {
  const factory RepoInfo({
    @Default("") String repoName,
    @Default("") String repoOwner,
    @Default("") String repoDescription,
  }) = _RepoInfo;
}
