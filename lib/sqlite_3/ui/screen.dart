import 'package:inware_test/screens/list_method/view.dart';
import 'package:inware_test/sqlite_3/model/mahsulot_mdel.dart';

class ScreensDB extends StatefulWidget {
  const ScreensDB({super.key});

  @override
  State<ScreensDB> createState() => _ScreensDBState();
}

class _ScreensDBState extends State<ScreensDB> {
  TextEditingController countController = TextEditingController();
  TextEditingController narxController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<MahsulotTable> objMahsulot = [];
  MahsulotTable mahsulotTable = MahsulotTable();

  _searchItem(String value) {
    objMahsulot = MahsulotTable.obyekt.values
        .where((element) =>
            element.nomi.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    _objectMahsulotTable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("S Q L I T E 3",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: 'search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              onChanged: (v) {
                _searchItem(v);
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              // itemCount: searchController.text.isEmpty? objMahsulot.length:searchItem.length,
              itemCount: objMahsulot.length,
              itemBuilder: (context, index) {
                MahsulotTable objectMahsulot = objMahsulot[index];
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.yellow, width: 2),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'nomi: ${objectMahsulot.nomi}',
                                style: sttyle,
                              ),
                              const Spacer(),
                              Text(
                                'count: ${objectMahsulot.count}',
                                style: sttyle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'category: ${objectMahsulot.category}',
                                style: sttyle,
                              ),
                              const Spacer(),
                              Text(
                                'narxi: ${objectMahsulot.narxi}',
                                style: sttyle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'id: ${objectMahsulot.id}',
                                style: sttyle,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      nomeController.text = objectMahsulot.nomi;
                                      categoryController.text =
                                          objectMahsulot.category;
                                      narxController.text =
                                          objectMahsulot.narxi.toString();
                                      countController.text =
                                          objectMahsulot.count.toString();
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Center(
                                              child: Text(
                                                'Tahrirlash',
                                                style: sttyle,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        CustomTextField(
                                                          hintText:
                                                              nomeController
                                                                  .text,
                                                          controller:
                                                              nomeController,
                                                          type: TextInputType
                                                              .text,
                                                          action:
                                                              TextInputAction
                                                                  .next,
                                                        ),
                                                        CustomTextField(
                                                          hintText:
                                                              categoryController
                                                                  .text,
                                                          controller:
                                                              categoryController,
                                                          type: TextInputType
                                                              .text,
                                                          action:
                                                              TextInputAction
                                                                  .next,
                                                        ),
                                                        CustomTextField(
                                                          hintText:
                                                              narxController
                                                                  .text,
                                                          controller:
                                                              narxController,
                                                          type: TextInputType
                                                              .number,
                                                          action:
                                                              TextInputAction
                                                                  .next,
                                                        ),
                                                        CustomTextField(
                                                          hintText:
                                                              countController
                                                                  .text,
                                                          controller:
                                                              countController,
                                                          type: TextInputType
                                                              .number,
                                                          action:
                                                              TextInputAction
                                                                  .done,
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            onPressedTahrirlash(
                                                              objectMahsulot,
                                                            );
                                                          },
                                                          child: Text(
                                                            'Tahrirlash',
                                                            style: sttyle,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.autorenew_outlined,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await objectMahsulot.delete();
                                      _selectAllDb();
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
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
                      controller: nomeController,
                      hintText: 'nomi',
                    ),
                    CustomTextField(
                      action: TextInputAction.next,
                      type: TextInputType.number,
                      controller: narxController,
                      hintText: 'narxi',
                    ),
                    CustomTextField(
                      action: TextInputAction.next,
                      type: TextInputType.number,
                      controller: countController,
                      hintText: 'count',
                    ),
                    CustomTextField(
                      action: TextInputAction.done,
                      type: TextInputType.text,
                      controller: categoryController,
                      hintText: 'category',
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () async {
                          MahsulotTable mahsulotTable = MahsulotTable();
                          mahsulotTable.nomi = nomeController.text;
                          mahsulotTable.narxi =
                              double.tryParse(narxController.text) ?? 2.0;
                          mahsulotTable.category = categoryController.text;
                          mahsulotTable.count = int.parse(countController.text);
                          await mahsulotTable.insert();
                          setState(() {});
                          await _selectAllDb();
                          clearControllers();
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

  Future<void> onPressedTahrirlash(MahsulotTable objectMahsulot) async {
    objectMahsulot.count = int.parse(countController.text);
    objectMahsulot.narxi = double.tryParse(narxController.text)!;
    objectMahsulot.nomi = nomeController.text;
    objectMahsulot.category = categoryController.text;
    await objectMahsulot.update();

    setState(() {});
    clearControllers();
    await _selectAllDb();
    Navigator.pop(context);
  }

  clearControllers() {
    countController.clear();
    narxController.clear();
    nomeController.clear();
    categoryController.clear();
  }

  @override
  void dispose() {
    countController.dispose();
    narxController.dispose();
    nomeController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  _selectAllDb() {
    objMahsulot = MahsulotTable.obyekt.values.toList();
    setState(() {
      objMahsulot;
    });
  }

  _objectMahsulotTable() async {
    MahsulotTable.obyekt = (await MahsulotTable.service.select())
        .map((key, value) => MapEntry(key, MahsulotTable.fromJson(value)));
    _selectAllDb();
  }
}
