import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'entity/github_search_result.dart';

class GithubUserSearchDao {
  const GithubUserSearchDao();

  Future<GithubSearchResult> getGithubUserName(String userQuery) async {
    final String url = "https://api.github.com/search/users?q=$userQuery";
    final client = http.Client();

    http.Response response;
    try {
      response = await client
          .get(url, headers: {"Accept": "application/vnd.github.v3+json"});
    } on Exception catch (e) {
      throw e;
    } finally {
      client.close();
    }

    if (response.statusCode >= 400) {
      throw HttpException("Http通信でstatusCodeが${response.statusCode}です。",
          uri: response.request.url);
    }
    return GithubSearchResult.fromJson(json.decode(response.body));
  }
}
