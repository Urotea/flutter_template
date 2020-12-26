import 'package:flutter/material.dart';

class GithubList extends StatelessWidget {
  final List<String> itemList;

  GithubList({Key key, @required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(),
            ),
          ),
          child: ListTile(
            leading: const Icon(Icons.flight_land),
            title: Text("title"),
            subtitle: Text("subtitle"),
            onTap: () {},
          ),
        );
      },
      itemCount: this.itemList.length,
    );
  }
}
