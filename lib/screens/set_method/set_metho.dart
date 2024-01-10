import 'package:inware_test/screens/list_method/view.dart';

class SetMethod extends StatefulWidget {
  const SetMethod({super.key});

  @override
  State<SetMethod> createState() => _SetMethodState();
}

class _SetMethodState extends State<SetMethod> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController narxController = TextEditingController();
  TextEditingController idController = TextEditingController();

  clearController() {
    nameController.clear();
    categoryController.clear();
    narxController.clear();
    idController.clear();
  }

  Set<Mahsulot> itemSet = {};

  _searchSet(String value) {
    Set<Mahsulot> result = {};
    if (value.isEmpty) {
      result = setProduct;
    } else {
      result = setProduct
          .where((element) =>
              element.nomi.toLowerCase().contains(value.toLowerCase()))
          .toSet();
    }
    setState(() {
      itemSet = result;
    });
  }

  @override
  void initState() {
    itemSet = setProduct;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Method'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (v) {
              _searchSet(v);
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(children: [
              ...List.generate(
                itemSet.length,
                (index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.teal, width: 2),
                    ),
                    child: ListTile(
                      title: Text(
                        'nomi: ${itemSet.elementAt(index).nomi}',
                        style: sttyle,
                      ),
                      subtitle: Text(
                        'category: ${itemSet.elementAt(index).category}',
                        style: sttyle,
                      ),
                      trailing: Text(
                        'narx: ${itemSet.elementAt(index).narx.toString()}\$',
                        style: sttyle,
                      ),
                      onTap: () {
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
                                              setProduct.remove(
                                                  setProduct.elementAt(index));
                                              setState(() {});
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('O\'chirish'),
                                          )),
                                      //mahsulotni tshrirlash
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            nameController.text = setProduct
                                                .elementAt(index)
                                                .nomi;
                                            categoryController.text = setProduct
                                                .elementAt(index)
                                                .category;
                                            narxController.text = setProduct
                                                .elementAt(index)
                                                .narx
                                                .toString();
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(actions: [
                                                    Column(children: [
                                                      CustomTextField(
                                                          hintText:
                                                              nameController
                                                                  .text,
                                                          controller:
                                                              nameController,
                                                          type: TextInputType
                                                              .text,
                                                          action:
                                                              TextInputAction
                                                                  .next),
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
                                                                  .next),
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
                                                                  .done),
                                                      const SizedBox(
                                                          height: 30),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            setProduct.remove(
                                                                setProduct
                                                                    .elementAt(
                                                                        index));
                                                            setState(() {});
                                                            setProduct.add(Mahsulot(
                                                                id: setProduct
                                                                    .elementAt(
                                                                        index)
                                                                    .id,
                                                                category:
                                                                    categoryController
                                                                        .text,
                                                                narx: int.parse(
                                                                    narxController
                                                                        .text),
                                                                nomi:
                                                                    nameController
                                                                        .text));
                                                            Navigator.of(
                                                                    context)
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
                    ),
                  );
                },
              ),
            ]),
          ),
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
                            setProduct.add(Mahsulot(
                                id: int.parse(idController.text),
                                category: categoryController.text,
                                narx: int.parse(narxController.text),
                                nomi: nameController.text));
                            Navigator.of(context).pop();
                            clearController();
                          },
                          child: const Text('Mahsulotni Qo\'shish'))
                    ],
                  )
                ]);
              });
        },
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
