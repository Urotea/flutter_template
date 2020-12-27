import 'package:flutter/foundation.dart';
import 'package:flutter_template/middleware/dao/entity/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_actions.freezed.dart';

@freezed
abstract class AppActions with _$AppActions {
  const factory AppActions.searchButtonTapped(String owner) =
      SearchButtonTapped;

  const factory AppActions.repositoryReceived(List<Repository> repos) =
      RepositoryReceived;
}
