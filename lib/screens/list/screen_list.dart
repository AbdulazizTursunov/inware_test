import 'package:flutter/material.dart';
import 'package:inware_test/global_fild.dart';

class NewWords extends StatefulWidget {
  const NewWords({super.key});

  @override
  State<NewWords> createState() => _NewWordsState();
}

class _NewWordsState extends State<NewWords> {
  TextEditingController controller = TextEditingController();
  List itemll = [];

  _search(String value) {
    List result = [];
    if (value.isNotEmpty) {
      result = itemsL;
    } else {
      result = itemsL
          .where((element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      itemll = result;
    });
  }

  @override
  void initState() {
    itemll = itemsL;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List'), centerTitle: true),
      body: Column(
        children: [
          TextField(
            onChanged: (v){
              _search(v);
            },
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(hintText: 'search...'),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: List.generate(
                itemll.length,
                (index) {
                  var item = itemll[index];
                  return ListTile(
                    title: Text(item),
                    leading: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'ma\'lumot qo\'shish va tahrirlash',
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
                                                      controller: controller,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText: itemsL
                                                                  .elementAt(
                                                                      index)
                                                                  .toString()),
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          itemsL.add(
                                                              controller.text);
                                                          setState(() {});
                                                          controller.clear();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            'Qo\'shish'),
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
                                                        hintText: itemsL
                                                            .elementAt(index)
                                                            .toString()),
                                                  ),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(() {
                                                          itemsL[index] =
                                                              controller.text;
                                                        });
                                                        controller.clear();
                                                      },
                                                      child: const Text(
                                                          'Tahrirlash'),
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
                        setState(() {});
                        itemsL.remove(item);
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
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
