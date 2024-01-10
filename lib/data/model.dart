import 'package:inware_test/data/crud_service.dart';
import 'package:inware_test/data/db_service.dart';

class Product {
  static CrudService service = ModelService();
  static final Map<int, Product> obyekt = {};

  Product({this.id, this.count = 0, this.name = ''});

  int count = 0;
  String name = '';
  int? id = 0;

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    count = int.parse(json['count'].toString());
    id = int.parse(json['id'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'name': name,
    };
  }

  Future<int> insert() async {
    Product.obyekt[id!] = this;
    id = await service.insert(toJson());
    return id!;
  }

  Future<void> delete() async {
    Product.obyekt.remove(id);
    await service.delete(where: "id = '$id' ");
  }

  Future<void> update() async {
    Product.obyekt[id!] = this;
    await service.update(toJson(), where: "id = '$id'");
  }
}

//  Model service productlar ustida  amallar bajarish uchun;

class ModelService extends CrudService {
  @override
  ModelService({super.prefix = ''}) : super('model');

  static String createTable = '''
  CREATE TABLE "model"(
  "count" INTEGER NOT NULL DEFAUL 0,
  "name" TEXT NOT NULL DEFAULT,
  "id" INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY ( "id"  AUTOINCREMENT)
    ); ''';

  @override
  Future<Map> select({String? where}) async {
    where = where == null ? "" : "WHERE $where";
    Map<int, dynamic> map = {};
    await for (final rows
        in db.watch("SELECT * FROM $table $where}", tables: [table])) {
      for (final element in rows) {
        map[element['id']] = element;
      }
      return map;
    }
    return map;
  }

  @override
  Future<Map> selectId(int id, {String? where}) async {
    Map row = await db.query("SELECT * FROM $table WHERE id = ?",
        params: [id], singleResult: true);
    return row;
  }

  @override
  Future<int> insert(Map map) async {
    map['id'] = (map['id'] == 0) ? null : map['id'];

    var insertId = await db.insert(map as Map<String, dynamic>, table);
    return insertId;
  }

  @override
  Future<void> update(Map map, {String? where}) async {
    where = where == null ? "" : "WHERE $where";

    String updateClause = '';
    final List params = [];
    final val = map.keys;
    for (String value in val) {
      if (updateClause.isNotEmpty) updateClause += ", ";
      updateClause += '$value =?';
      params.add(map[value]);
    }

    final String sql = "UPDATE $table SET $updateClause $where";
    await db.execute(sql, tables: [table], params: params);
  }

  @override
  Future<void> delete({String? where}) async {
    where = where == null ? "" : "WHERE $where";
    await db.query("DELETE FROM '$table' $where");
  }

  @override
  Future<void> deleteId(int id, {String? where}) {
    // TODO: implement deleteId
    throw UnimplementedError();
  }

  @override
  Future<int> newId() {
    // TODO: implement newId
    throw UnimplementedError();
  }

  @override
  Future<void> replace(Map map) {
    // TODO: implement replace
    throw UnimplementedError();
  }

  @override
  Future<int> count({String? where}) {
    // TODO: implement count
    throw UnimplementedError();
  }
}
