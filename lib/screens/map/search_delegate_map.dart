import 'package:flutter/material.dart';
import 'package:inware_test/global_fild.dart';

class CustomSearchMap extends SearchDelegate {
  List result = itemM.values.toList();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.close,
          color: Colors.red,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List match = [];
    for (var element in result) {
      if (element.toString().toLowerCase().contains(query.toLowerCase())) {
        match.add(element);
      }
    }
    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          match[index],
          style: sttyle,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List match = [];
    for (var element in result) {
      if (element.toString().toLowerCase().contains(query.toLowerCase())) {
        match.add(element);
      }
    }
    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          match[index],
          style: sttyle,
        ),
      ),
    );
  }
}
