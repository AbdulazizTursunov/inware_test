import 'package:inware_test/data/model.dart';
import 'package:inware_test/screens/list_method/view.dart';

import '../data/mahsulot.dart';

class DbUi extends StatefulWidget {
  const DbUi({super.key});

  @override
  State<DbUi> createState() => _DbUiState();
}

class _DbUiState extends State<DbUi> {
  TextEditingController nameController = TextEditingController();
  TextEditingController narxController = TextEditingController();

  clearController() {
    nameController.clear();
    narxController.clear();
  }

  Product product = Product();

  List mahsulotObjectList = [];

  _selectAll() {
    mahsulotObjectList = Mahsulot2.obyektlar.values.toList();
    setState(() {
      mahsulotObjectList;
    });
  }

  _obekt() async {
    Mahsulot2.obyektlar = (await Mahsulot2.service.select()).map(
      (key, value) => MapEntry(
        key,
        Mahsulot2.fromJson(value),
      ),
    );
  }

  @override
  void initState() {
    _obekt();
    _selectAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: ListView(
        children: [
          ...List.generate(mahsulotObjectList.length, (index) {
            Mahsulot2 mahsul = mahsulotObjectList[index];
            print(mahsul.nomi);
            return ListTile(
              title: Text(
                'nomi: ${mahsul.nomi}',
                style: sttyle,
              ),
              subtitle: Text(
                'narxi: ${mahsul.narxi}',
                style: sttyle,
              ),
              trailing: Text(
                'id: ${mahsul.tr}',
                style: sttyle,
              ),
              onTap: () async {
                await mahsul.delete();
                _selectAll();
                setState(() {});
              },
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(actions: [
                Column(
                  children: [
                    const SizedBox(height: 15),
                    CustomTextField(
                      action: TextInputAction.next,
                      type: TextInputType.text,
                      controller: nameController,
                      hintText: 'nomi',
                    ),
                    CustomTextField(
                      action: TextInputAction.done,
                      type: TextInputType.number,
                      controller: narxController,
                      hintText: 'narxi',
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () async {
                          Mahsulot2 mahsulot2 = Mahsulot2();
                          mahsulot2.nomi = nameController.text;
                          mahsulot2.narxi = double.tryParse(narxController.text) ?? 2.0;
                          // await mahsulot2.update();
                          await mahsulot2.insert();
                          await _selectAll();
                          clearController();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Mahsulotni Qo\'shish'))
                  ],
                )
              ]);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
