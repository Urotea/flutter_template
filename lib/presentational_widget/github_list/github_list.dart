import 'package:flutter/material.dart';
import 'package:flutter_template/state/entity/repo_info.dart';

import 'github_list_item.dart';

class GithubList extends StatelessWidget {
  final List<RepoInfo> repoInfoList;

  GithubList({Key key, @required this.repoInfoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return GithubListItem(
          repoName: this.repoInfoList[index].repoName,
          repoDescription: this.repoInfoList[index].repoDescription,
          repoOwner: this.repoInfoList[index].repoOwner,
          onTap: () {},
        );
      },
      itemCount: this.repoInfoList.length,
    );
  }
}
