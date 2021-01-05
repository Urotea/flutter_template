import 'package:flutter_template/presentational_widget/github_user_search/entity/github_search_result_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_search_result.freezed.dart';
part 'github_search_result.g.dart';

@freezed
abstract class GithubSearchResult with _$GithubSearchResult {
  const factory GithubSearchResult({
    int totalCount,
    bool incompleteResults,
    List<GithubSearchResultItem> items,
  }) = _GithubSearchResult;

  factory GithubSearchResult.fromJson(Map<String, dynamic> json) =>
      _$GithubSearchResultFromJson(json);
}
