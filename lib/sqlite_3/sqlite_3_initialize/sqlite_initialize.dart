import 'package:sqlite_wrapper/sqlite_wrapper.dart';
import 'package:path/path.dart';

SQLiteWrapper db = SQLiteWrapper();

class DatabaseSq {
  DatabaseSq._init();

  static final DatabaseSq _singleton = DatabaseSq._init();
  int version = 1;

  factory DatabaseSq() {
    return _singleton;
  }

  Future<DatabaseInfo> initDb(dbPath, {inMemory = false}) async {
    dbPath = join(dbPath, 'base.sqlite');
    return db.openDB(
      dbPath,
      version: version,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate() async {
    List<String> sql = [];

    for (var query in sql) {
      await db.execute(query);
    }
  }
}
