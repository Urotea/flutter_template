import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_search_result_item.freezed.dart';
part 'github_search_result_item.g.dart';

@freezed
abstract class GithubSearchResultItem with _$GithubSearchResultItem {
  const factory GithubSearchResultItem({
    String login,
    int id,
    String nodeId,
    String avatarUrl,
    String gravatarId,
    String url,
    String htmlUrl,
    String followersUrl,
    String followingUrl,
    String gistsUrl,
    String starredUrl,
    String subscriptionsUrl,
    String organizationsUrl,
    String reposUrl,
    String eventsUrl,
    String receivedEventsUrl,
    String type,
    bool siteAdmin,
    double score,
  }) = _GithubSearchResultItem;

  factory GithubSearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$GithubSearchResultItemFromJson(json);
}
