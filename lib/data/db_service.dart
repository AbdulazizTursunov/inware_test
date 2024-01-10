import 'package:inware_test/data/mahsulot.dart';
import 'package:inware_test/sqlite_3/model_service/model_seervice.dart';
import 'package:sqlite_wrapper/sqlite_wrapper.dart';
import 'package:path/path.dart';

import '../screens/list_method/view.dart';

SQLiteWrapper db = SQLiteWrapper();

class DatabaseHelper {
  DatabaseHelper._internal();

  static final DatabaseHelper _singleton = DatabaseHelper._internal();
  static const int version = 1;

  factory DatabaseHelper() {
    return _singleton;
  }

  Future<DatabaseInfo> initDB(dbPath, {inMemory = false}) async {
    dbPath = join(dbPath, "base.sqlite");

    return db.openDB(
      dbPath,
      version: version,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate() async {
    List<String> sql = [];
    sql.add(Mahsulot2Service.createTable);
    sql.add(ModelSer.createTableS);

    debugPrint('db creatae: $db');
    for (var query in sql) {
      await db.execute(query);
    }
  }
}
