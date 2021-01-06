import 'dart:convert';

import 'package:flutter_template/middleware/dao/exception/http_exception.dart';
import 'package:http/http.dart' as http;
import 'package:oxidized/oxidized.dart';

import 'entity/repository.dart';

class GithubDao {
  GithubDao();

  Future<Result<List<Repository>, HttpException>> fetchRepositories(
      String ownerName) async {
    final String url = "https://api.github.com/users/$ownerName/repos";
    final client = http.Client();

    Result<http.Response, HttpException> response;
    try {
      response = Result.ok(await client.get(url));
    } on Exception catch (e) {
      response =
          Result.err(HttpException.connection(message: "接続に失敗しました。", cause: e));
    } finally {
      client.close();
    }

    return response.andThen((res) {
      if (res.statusCode >= 400) {
        return Result.err(HttpException.response(statusCode: res.statusCode));
      } else {
        return Result.ok(res);
      }
    }).map((res) =>
        List<Map<String, dynamic>>.from(json.decode(res.body) as List<dynamic>)
            .map((e) => Repository.fromJson(e))
            .toList());
  }
}
