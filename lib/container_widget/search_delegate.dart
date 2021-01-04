import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_template/state/main_state.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  void showSuggestions(BuildContext context) {
    super.showSuggestions(context);
  }

  @override
  void showResults(BuildContext context) {
    // super.showResults(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(icon: Icon(Icons.close), onPressed: () => query = ''),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      );

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) =>
      StoreConnector<MainState, List<String>>(
        converter: (store) => store.state.repoInfoList.map((e) => e.repoName).toList(),
        builder: (context, list) => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(list[index]),
          ),
          itemCount: list.length,
        ),
      );
}
