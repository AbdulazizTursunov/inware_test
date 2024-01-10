import 'package:inware_test/screens/list_method/view.dart';

class CustomSearchDelegate extends SearchDelegate {
  List result = itemsL;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear_sharp,
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
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> resultTwo = [];

    for (var element in result) {
      if (element.toString().toLowerCase().contains(query.toLowerCase())) {
        resultTwo.add(element);
      }
    }
    return ListView(
      children: [
        ...List.generate(
          resultTwo.length,
          (index) => ListTile(
            title: Text(
              resultTwo[index],
              style: sttyle,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> resultTwo = [];

    for (var element in result) {
      if (element.toString().toLowerCase().contains(query.toLowerCase())) {
        resultTwo.add(element);
      }
    }
    return ListView(
      children: [
        ...List.generate(
          resultTwo.length,
          (index) => ListTile(
            title: Text(
              resultTwo[index],
              style: sttyle,
            ),
          ),
        ),
      ],
    );
  }
}
