import 'package:inware_test/data/crud_service.dart';
import 'package:inware_test/data/db_service.dart';

class Mahsulot2 {
  static CrudService service = Mahsulot2Service();
  static  Map<int, Mahsulot2> obyektlar = {};

  int tr = 0;
  String nomi = '';
  double narxi = 0;

  Mahsulot2();

  Mahsulot2.fromJson(Map<String, dynamic> json) {
    tr = int.parse(json['tr'].toString());
    nomi = json['nomi'].toString();
    narxi = 0;
  }

  Map<String, dynamic> toJson() => {
    'tr': tr,
    'nomi': nomi,
    'narxi': narxi,
  };

  Future<int> insert() async {
    Mahsulot2.obyektlar[tr] = this;
    tr = await service.insert(toJson());

    return tr;
  }

  Future<void> delete() async {
    Mahsulot2.obyektlar.remove(tr);
    await service.delete(where: " tr='$tr'");
  }

  Future<void> update() async {
    Mahsulot2.obyektlar[tr] = this;
    await service.update(toJson(), where: " tr='$tr'");
  }
}

class Mahsulot2Service extends CrudService {
  @override
  Mahsulot2Service({super.prefix = ''}) : super("mahsulot");

  static String createTable = """
CREATE TABLE "mahsulot" (
  "tr"  INTEGER NOT NULL DEFAULT 0,
  "nomi"  TEXT NOT NULL DEFAULT '',
  "narxi"  REAL NOT NULL DEFAULT 0,
  PRIMARY KEY("tr" AUTOINCREMENT)
);
  """;

  @override
  Future<Map> select({String? where}) async {
    where = where == null ? "" : " WHERE $where";
    Map<int, dynamic> map = {};
    await for (final rows
    in db.watch("SELECT * FROM $table $where", tables: [table])) {
      for (final element in rows) {
        map[element['tr']] = element;
      }
      return map;
    }
    return map;
  }

  @override
  Future<Map> selectId(int id, {String? where}) async {
    Map row = await db.query("SELECT * FROM $table WHERE tr = ?",
        params: [id],
        //fromMap: (map) => {},
        singleResult: true);
    return row;
  }

  @override
  Future<void> delete({String? where}) async {
    where = where == null ? "" : " WHERE $where";
    await db.query("DELETE FROM `$table` $where");
  }

  @override
  Future<void> deleteId(int id, {String? where}) async {
    if (where == null) {
      where = ' tr=\'$id\'';
    } else {
      where = " tr='$id' AND $where";
    }
    await delete(where: where);
  }

  @override
  Future<int> count({String? where}) async {
    where = where == null ? "" : " WHERE $where";
    Map row = await db.query("SELECT COUNT(*) FROM $table$where",
        //params: [table],
        //fromMap: (map) => {},
        singleResult: true);
    return int.parse(row['seq'].toString()) + 1;
  }

  @override
  Future<int> insert(Map map) async {
    map['tr'] = (map['tr'] == 0) ? null : map['tr'];

    var insertId = await db.insert(map as Map<String, dynamic>, table);
    return insertId;
  }

  @override
  Future<int> newId() async {
    Map row = await db.query("SELECT * FROM sqlite_sequence WHERE name = ?",
        params: [table],
        //fromMap: (map) => {},
        singleResult: true);
    return int.parse(row['seq'].toString()) + 1;
  }

  @override
  Future<int> replace(Map map) async {
    map['tr'] = (map['tr'] == 0) ? null : map['tr'];
    var cols = '';
    var vals = '';
    var vergul = '';
    map.forEach(
          (col, val) {
        val = val.toString().replaceAll("\\", "/").replaceAll("'", "`");
        col = col;
        cols += "$vergul `$col`";
        vals += "$vergul '$val'";
        if (vergul == "") {
          vergul = ',';
        }
      },
    );
    var sql = "REPLACE INTO $table ($cols) VALUES ($vals)";
    await db.query(sql);
    return 0;
  }

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

    final String sql = "UPDATE $table SET $updateClause$where";
    await db.execute(sql, tables: [table], params: params);
    //await db.query(sql);
    //await db.update(map as Map<String, dynamic>, table, keys: []);
  }
}
