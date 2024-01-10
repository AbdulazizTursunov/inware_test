import 'view.dart';

class MahsulotList extends StatefulWidget {
  const MahsulotList({super.key});

  @override
  State<MahsulotList> createState() => _MahsulotListState();
}

class _MahsulotListState extends State<MahsulotList> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController narxController = TextEditingController();
  TextEditingController idController = TextEditingController();

  List<Mahsulot> fields = [];

  _search(String value) {
    List<Mahsulot> result = [];
    if (value.isEmpty) {
      result = listProduct;
    } else {
      result = listProduct
          .where((element) =>
              element.nomi.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      fields = result;
    });
  }

  clearController() {
    nameController.clear();
    categoryController.clear();
    narxController.clear();
    idController.clear();
  }

  @override
  void initState() {
    fields = listProduct;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onChanged: (v) {
              setState(
                () {
                  _search(v);
                },
              );
            },
            decoration: InputDecoration(
                hintText: 'search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: List.generate(fields.length, (index) {
                mahsulot = fields[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title:
                                    const Text('Mahsulot o\'chirish va tahrirlash'),
                                actions: [
                                  Column(children: [
                                    //mahsulotni o'chirish
                                    SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            listProduct
                                                .remove(listProduct[index]);
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
                                          nameController.text = mahsulot!.nomi;
                                          categoryController.text =
                                              mahsulot!.category;
                                          narxController.text =
                                              mahsulot!.narx.toString();
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
                                                          setState(() {
                                                            listProduct[index] = Mahsulot(
                                                                id: mahsulot!
                                                                    .id,
                                                                category:
                                                                    categoryController
                                                                        .text,
                                                                narx: int.parse(
                                                                    narxController
                                                                        .text),
                                                                nomi:
                                                                    nameController
                                                                        .text);
                                                          });
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
                    title: Text('nomi: ${mahsulot!.nomi}', style: sttyle),
                    subtitle: Text('categoriya: ${mahsulot!.category}',
                        style: sttyle),
                    trailing: Text('narxi: ${mahsulot!.narx}\$', style: sttyle),
                  ),
                );
              }),
            ),
          ),
        ],
      ),

      // mahsulotni qo'shish;
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(actions: [
                  Column(
                    children: [
                      TextField(
                        controller: idController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'id',
                        ),
                      ),
                      TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        decoration:const InputDecoration(
                          hintText: 'nomi',
                        ),
                      ),
                      TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        controller: categoryController,
                        decoration: const InputDecoration(
                          hintText: 'category',
                        ),
                      ),
                      TextField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        controller: narxController,
                        decoration:const  InputDecoration(
                          hintText: 'narxi',
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {});
                            listProduct.add(Mahsulot(
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
