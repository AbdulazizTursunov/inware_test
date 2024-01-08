import 'package:flutter/material.dart';
import 'package:inware_test/data/mahsulot.dart';
import 'package:inware_test/data/model/mahsulot_obekti.dart';
import 'package:inware_test/global_fild.dart';
import 'package:inware_test/screens/list_method/widget/text_field.dart';

class MapMethod extends StatefulWidget {
  const MapMethod({super.key});

  @override
  State<MapMethod> createState() => _MapMethodState();
}

class _MapMethodState extends State<MapMethod> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController narxController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController keyController = TextEditingController();

  clearController() {
    keyController.clear();
    nameController.clear();
    categoryController.clear();
    narxController.clear();
    idController.clear();
  }

  Map<String, Mahsulot> itemMap = {};

  _searchMap(String value) {
    Map<String, Mahsulot> result = {};
    if (value.isEmpty) {
      result = mapProduct;
    } else {
      result = mapProduct.values
          .where((element) =>
              element.nomi.toLowerCase().contains(value.toLowerCase()))
          .toString() as Map<String, Mahsulot>;
    }
    setState(() {
      itemMap = result;
    });
  }

  @override
  void initState() {
    itemMap = mapProduct;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Method'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (v) {
              _searchMap(v);
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: [
                ...List.generate(itemMap.keys.length, (index) {
                  var mapPro = itemMap.values.elementAt(index);
                  String keys = itemMap.keys.elementAt(index);
                  return ListTile(
                    title: Text(
                      'nomi: ${mapPro.nomi}',
                      style: sttyle,
                    ),
                    subtitle: Text(
                      'category: ${mapPro.category}',
                      style: sttyle,
                    ),
                    trailing: Text(
                      'narx: ${mapPro.narx}\$',
                      style: sttyle,
                    ),
                    onTap: () {
                      nameController.text = mapPro.nomi;
                      categoryController.text = mapPro.category;
                      narxController.text = mapPro.narx.toString();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Text(
                                    'Mahsulot o\'chirish va tahrirlash'),
                                actions: [
                                  Column(children: [
                                    //mahsulotni o'chirish
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          mapProduct.remove(
                                              mapProduct.keys.elementAt(index));
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('O\'chirish'),
                                      ),
                                    ),

                                    //mahsulotni tahrirlash
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(actions: [
                                                  Column(children: [
                                                    CustomTextField(
                                                        hintText:
                                                            nameController.text,
                                                        controller:
                                                            nameController,
                                                        type:
                                                            TextInputType.text,
                                                        action: TextInputAction
                                                            .next),
                                                    CustomTextField(
                                                        hintText:
                                                            categoryController
                                                                .text,
                                                        controller:
                                                            categoryController,
                                                        type:
                                                            TextInputType.text,
                                                        action: TextInputAction
                                                            .next),
                                                    CustomTextField(
                                                        hintText:
                                                            narxController.text,
                                                        controller:
                                                            narxController,
                                                        type: TextInputType
                                                            .number,
                                                        action: TextInputAction
                                                            .done),
                                                    const SizedBox(height: 30),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          setState(() {});
                                                          mapProduct[keys] = Mahsulot(
                                                              id: mapPro.id,
                                                              category:
                                                                  categoryController
                                                                      .text,
                                                              narx: int.parse(
                                                                  narxController
                                                                      .text),
                                                              nomi:
                                                                  nameController
                                                                      .text);
                                                          Navigator.of(context)
                                                              .pop();
                                                          clearController();
                                                        },
                                                        child: const Text(
                                                            'O\'zgartirish'))
                                                  ]),
                                                ]);
                                              });
                                        },
                                        child: const Text('Tahrirlash'),
                                      ),
                                    ),
                                  ])
                                ]);
                          });
                    },
                  );
                })
              ],
            ),
          ),
        ],
      ),

      // add product  << map >>
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(actions: [
                Column(
                  children: [
                    CustomTextField(
                      controller: keyController,
                      action: TextInputAction.next,
                      type: TextInputType.text,
                      hintText: 'key',
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: idController,
                      action: TextInputAction.next,
                      type: TextInputType.number,
                      hintText: 'id',
                    ),
                    CustomTextField(
                      action: TextInputAction.next,
                      type: TextInputType.text,
                      controller: nameController,
                      hintText: 'nomi',
                    ),
                    CustomTextField(
                      action: TextInputAction.next,
                      type: TextInputType.text,
                      controller: categoryController,
                      hintText: 'category',
                    ),
                    CustomTextField(
                      action: TextInputAction.done,
                      type: TextInputType.number,
                      controller: narxController,
                      hintText: 'narxi',
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        Map<String, Mahsulot> mPPS = {};
                        mPPS = Map.fromIterables(
                          [keyController.text],
                          [
                            Mahsulot(
                                id: int.parse(idController.text),
                                category: categoryController.text,
                                narx: int.parse(narxController.text),
                                nomi: nameController.text)
                          ],
                        );
                        mapProduct.addAll(mPPS);
                        Navigator.of(context).pop();
                        clearController();
                      },
                      child: const Text('Mahsulotni Qo\'shish'),
                    )
                  ],
                )
              ]);
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
