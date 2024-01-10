import 'package:flutter/material.dart';
import 'package:inware_test/sqlite_3/crud_service/crud_service.dart';
import 'package:inware_test/sqlite_3/sqlite_3_initialize/sqlite_initialize.dart';


class ModelSer extends CrudService {
  @override
  ModelSer({super.prefix = ''}) : super("mahsulotTable");

  // bazada table create qilish;
  static String createTableS = """                
  CREATE TABLE "mahsulotTable" (
  "id" INTEGER  NOT NULL DEFAULT 0,
  "count" INTEGER NOT NULL DEFAULT 0,
 "narxi" REAL NOT NULL DEFAULT 0.0,
  "nomi" TEXT NOT NULL DEFAULT '',
  "category" TEXT NOT NULL DEFAULT '',
  PRIMARY KEY("id" AUTOINCREMENT)
  );
  """;

  //tabledagi malumotlar sonini bilish uchun;
  @override
  Future<int> count({String? where}) async {
    where = where == null ? "" : "WHERE $where";
    Map row =
    await db.query("SELECT COUNT * FROM $tableMahsulotSer $where", singleResult: true);
    debugPrint('ModelSer "count" methodi ishladi');
    return int.parse(row['seq'].toString()) + 1;
  }


  //bazadan tableni o'chirish
  @override
  Future<void> delete({String? where}) async {
    where = where == null ? "" : "WHERE $where";
    await db.query("DELETE FROM $tableMahsulotSer  $where");
    debugPrint('ModelSer "delete" methodi ishladi');
  }


  //tabledagi malumotni IDsi boyicha tekshirib o'chirish
  @override
  Future<void> deleteId(int id, {String? where}) async {
    if (where == null) {
      where = 'id=/$id';
    } else {
      where = "id = \$id AND $where";
    }
    await delete(where: where);
    debugPrint('ModelSer "deleteId" methodi ishladi');
  }


  //bazada create qilingan tablega malumot qo'shish
  @override
  Future<int> insert(Map map) async {
    map['id'] = (map['id'] == 0) ? null : map['id'];
    var insertID = await db.insert(map as Map<String, dynamic>, tableMahsulotSer);
    debugPrint('ModelSer "insert" methodi ishladi');
    return insertID;
  }


  // ? ? ? ? ? ? ?
  @override
  Future<int> newId() async {
    Map row = await db.query("SELECT * FROM sqlite_sequence WHERE name = ?",
        params: [tableMahsulotSer], singleResult: true);
    debugPrint('ModelSer "newId" methodi ishladi');
    return int.parse(row['seq'].toString()) + 1;
  }


  // ? ? ? ? ? ? ?
  @override
  Future<int> replace(Map map) async {
    map['id'] = (map['id'] == 0) ? null : map['id'];
    var cols = '';
    var vals = '';
    var vergul = '';
    map.forEach(
      (key, value) {
        value = value.toString().replaceAll("\\", "/").replaceAll("'", "`");
        key = key;
        cols += "$vergul `$key`";
        cols += "$vergul  '$key";
        if (vergul == "") {
          vergul = ',';
        }
      },
    );
    var sql = "REPLACE INTO $tableMahsulotSer ($cols) VALUES ($vals)";
    await db.query(sql);
    debugPrint('ModelSer "replace" methodi ishladi');
    return 0;
  }


  //tabledan barcha malumotlarni o'qib olish
  @override
  Future<Map> select({String? where}) async {
    where = where == null ? "" : "WHERE $where";
    Map<int, dynamic> map = {};
    await for (final rows
        in  db.watch("SELECT * FROM $tableMahsulotSer $where", tables: [tableMahsulotSer])) {
      for (final element in rows) {
        debugPrint('ModelSer "select" methodi ishlamadi for ichida qoldi');

        map[element['id']] = element;
      }
      return map;
    }
    debugPrint('ModelSer "select" methodi ishladi');
    return map;
  }


  //bazadan malumotlarni IDsi bo'yich o'qib olish
  @override
  Future<Map> selectId(int id, {String? where}) async {
    Map row = await db.query("SELECT * FROM $tableMahsulotSer WHERE id = ?",
        params: [id], singleResult: true);
    debugPrint('ModelSer "selectID" methodi ishladi');
    return row;
  }


  //tabledagi malumotni o'zgartirish
  @override
  Future<void> update(Map map, {String? where}) async {
    where = where == null ? "" : " WHERE $where";

    String updateClause = "";
    final List params = [];
    final values = map.keys; //.where((element) => !keys.contains(element));
    for (String value in values) {
      if (updateClause.isNotEmpty) updateClause += ", ";
      updateClause += "$value=?";
      params.add(map[value]);
    }

    final String sql = "UPDATE $tableMahsulotSer SET $updateClause$where";
    await db.execute(sql, tables: [tableMahsulotSer], params: params);
    //await db.query(sql);
    //await db.update(map as Map<String, dynamic>, table, keys: []);
  }
}
