import 'dart:convert';

import 'package:flutter_template/middleware/dao/exception/http_exception.dart';
import 'package:http/http.dart' as http;

import 'entity/repository.dart';

class GithubDao {
  GithubDao();

  Future<List<Repository>> fetchRepositories(String ownerName) async {
    final String url = "https://api.github.com/users/$ownerName/repos";
    final client = http.Client();

    http.Response response;
    try {
      response = await client.get(url);
    } on Exception catch (e) {
      throw HttpException.connection(message: "接続に失敗しました。", cause: e);
    } finally {
      client.close();
    }

    if (response.statusCode >= 400) {
      throw HttpException.response(statusCode: response.statusCode);
    }

    final List<dynamic> responseObj = json.decode(response.body);
    return List<Map<String, dynamic>>.from(responseObj)
        .map((e) => Repository.fromJson(e))
        .toList();
  }
}
