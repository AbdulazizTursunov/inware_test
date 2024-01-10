import 'package:flutter/material.dart';
import 'package:inware_test/global_fild.dart';
import 'package:inware_test/screens/map/search_delegate_map.dart';

class NewWordMap extends StatefulWidget {
  const NewWordMap({super.key});

  @override
  State<NewWordMap> createState() => _NewWordMapState();
}

class _NewWordMapState extends State<NewWordMap> {
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  void addMap(int key, String quan) {
    itemM.update(key, (value) => quan, ifAbsent: () => quan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchMap());
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
        title: const Text('Map'),
        centerTitle: true,
      ),
      body: ListView(
        children: List.generate(
          itemM.length,
          (index) {
            int key = itemM.keys.elementAt(index);
            String value = itemM.values.elementAt(index);
            return ListTile(
              title: Text('$key:  $value'),
              leading: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'editing and add item',
                        style: TextStyle(fontSize: 20),
                      ),
                      actions: [
                        Column(
                          children: [
                            //add item
                            SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        actions: [
                                          Column(
                                            children: [
                                              TextField(
                                                controller: keyController,
                                                decoration: InputDecoration(
                                                    hintText: itemM.keys
                                                        .elementAt(index)
                                                        .toString()),
                                              ),
                                              TextField(
                                                controller: valueController,
                                                textInputAction:
                                                    TextInputAction.done,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    hintText: itemM.values
                                                        .elementAt(index)
                                                        .toString()),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {});
                                                    addMap(
                                                        int.parse(
                                                            keyController.text),
                                                        valueController.text);
                                                    Navigator.of(context).pop();
                                                    keyController.clear();
                                                    valueController.clear();
                                                  },
                                                  child:
                                                      const Text('Qo\'shish'),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text('Qo\'shish'),
                                )),
                            //editing item
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        Column(
                                          children: [
                                            TextField(
                                              controller: keyController,
                                              decoration: InputDecoration(
                                                  hintText: itemM.values
                                                      .elementAt(index)),
                                            ),
                                            TextField(
                                              controller: valueController,
                                              decoration: InputDecoration(
                                                  hintText: itemM.values
                                                      .elementAt(index)
                                                      .toString()),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  setState(() {});
                                                  // itemM.keys.toList()[index] = keyController.text;
                                                  // itemM.values.toList()[index] = int.parse(valueController.text);
                                                  itemM[key] =
                                                      keyController.text;

                                                  Navigator.of(context).pop();
                                                  keyController.clear();
                                                  valueController.clear();
                                                },
                                                child: const Text('Tahrirlash'),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Tahrirlash'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(
                    () {
                      itemM.remove(itemM.keys.elementAt(index));
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    keyController.dispose();
    valueController.dispose();
    super.dispose();
  }
}
