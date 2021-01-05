import 'dart:convert';
import 'dart:io';
import 'dart:developer' as logger;

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
    logger.log("httpを実際に行いました。", time: DateTime.now());

    if (response.statusCode >= 400) {
      throw HttpException("Http通信でstatusCodeが${response.statusCode}です。",
          uri: response.request.url);
    }
    return GithubSearchResult.fromJson(json.decode(response.body));
  }
}
