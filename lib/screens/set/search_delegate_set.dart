import 'package:flutter/material.dart';
import 'package:inware_test/global_fild.dart';

class CustomSearchSet extends SearchDelegate {
  List resultItem = itemsS.toList();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear_outlined,
          color: Colors.red,
        ),
      )
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
    List result = [];

    for (var element in resultItem) {
      if (element.toString().toLowerCase().contains(query.toLowerCase())) {
        result.add(element);
      }
    }
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              result[index],
              style: sttyle,
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List result = [];

    for (var element in resultItem) {
      if (element.toString().toLowerCase().contains(query.toLowerCase())) {
        result.add(element);
      }
    }
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              result[index],
              style: sttyle,
            ),
          );
        });
  }
}
