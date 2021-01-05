import 'dart:async';
import 'dart:developer' as logger;

import 'package:flutter/material.dart';
import 'package:flutter_template/presentational_widget/github_user_search/entity/github_search_result.dart';
import 'package:flutter_template/presentational_widget/github_user_search/github_user_search_dao.dart';
import 'package:throttling/throttling.dart';

typedef _ThrottlingCallback = Future<GithubSearchResult> Function(String);

class GithubUserSearch extends SearchDelegate<String> {
  final GithubUserSearchDao dao;
  final throttling = Throttling(duration: Duration(milliseconds: 1500));
  Future<GithubSearchResult> searchResult = (Completer<GithubSearchResult>()
        ..complete(GithubSearchResult(
            totalCount: 0, incompleteResults: false, items: [])))
      .future;

  GithubUserSearch({@required this.dao}) : assert(dao != null);

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(icon: Icon(Icons.clear), onPressed: () => query = ''),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      );

  @override
  Widget buildResults(BuildContext context) =>
      _suggestionList(context, _refreshThrottling);

  @override
  Widget buildSuggestions(BuildContext context) =>
      _suggestionList(context, _getThrottling);

  Widget _suggestionList(BuildContext context, _ThrottlingCallback callback) =>
      FutureBuilder<GithubSearchResult>(
        future: callback(query),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            logger.log("http通信に失敗しました。",
                error: snapshot.error, time: DateTime.now());
            return Container();
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Container();
          }

          var result = snapshot.data.items.map((e) => e.login).toList();
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(result[index]),
              onTap: () => close(context, result[index]),
            ),
            itemCount: result.length,
          );
        },
      );

  Future<GithubSearchResult> _getThrottling(q) {
    searchResult =
        throttling.throttle(() => dao.getGithubUserName(q)) ?? searchResult;
    return searchResult;
  }

  Future<GithubSearchResult> _refreshThrottling(q) {
    searchResult = dao.getGithubUserName(q);
    return searchResult;
  }
}
