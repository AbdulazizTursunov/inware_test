import 'package:flutter/material.dart';
import 'package:inware_test/global_fild.dart';

class NewWordSet extends StatefulWidget {
  const NewWordSet({super.key});

  @override
  State<NewWordSet> createState() => _NewWordSetState();
}

class _NewWordSetState extends State<NewWordSet> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
        title: const Text('Set'),
        centerTitle: true,
      ),
      body: ListView(
        children: List.generate(itemsS.length, (index) {
          return ListTile(
            title: Text(itemsS.elementAt(index).toString()),
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
                          //  add item

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
                                              controller: controller,
                                              decoration: InputDecoration(
                                                  hintText: itemsS
                                                      .elementAt(index)
                                                      .toString()),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  itemsS.add(controller.text);
                                                  setState(() {});
                                                  Navigator.of(context).pop();
                                                  controller.clear();
                                                },
                                                child: const Text('Qo\'shish'),
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
                                            controller: controller,
                                            decoration: InputDecoration(
                                                hintText: itemsS
                                                    .elementAt(index)
                                                    .toString()),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (itemsS.contains(
                                                    itemsS.elementAt(index))) {
itemsS.remove(itemsS.elementAt(index));
itemsS.add(controller.text);

                                                }
                                                Navigator.of(context).pop();
                                                controller.clear();
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
                setState(() {
                  itemsS.remove(itemsS.elementAt(index));
                });
              },
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: Colors.red,
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
