import 'package:inware_test/sqlite_3/crud_service/crud_service.dart';
import 'package:inware_test/sqlite_3/model_service/model_seervice.dart';

class MahsulotTable {
  static CrudService service = ModelSer();
  static  Map<int, MahsulotTable> obyekt = {};

  int id = 0;
  int count = 0;
  double narxi = 0.0;
  String nomi = '';
  String category = '';

  MahsulotTable();

  MahsulotTable.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    count = int.parse(json['count'].toString());
    narxi = double.tryParse(json['narxi'].toString())!;
    nomi = json['nomi'].toString();
    category = json['category'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'count': count,
      'narxi': narxi,
      'nomi': nomi,
      'category': category,
    };
  }

  Future<int> insert() async {
    MahsulotTable.obyekt[id] = this;
    id = await service.insert(toJson());
    return id;
  }

  Future<void> delete() async {
    MahsulotTable.obyekt.remove(id);
    await service.delete(where: "id='$id'");
  }

  Future<void> update() async {
    MahsulotTable.obyekt[id] = this;
    await service.update(toJson(), where: "id='$id'");
  }
}
