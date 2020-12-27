import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GithubListItem extends StatelessWidget {
  final String repoName;
  final String repoDescription;
  final String repoOwner;
  final void Function() onTap;

  GithubListItem({
    Key key,
    @required this.repoName,
    @required this.repoDescription,
    @required this.repoOwner,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(),
        ),
      ),
      child: ListTile(
        title: Text("$repoOwner/$repoName"),
        subtitle: Text(repoDescription),
        onTap: this.onTap,
      ),
    );
  }
}
