// import 'package:flutter/material.dart';
// import 'package:inware_test/data/model/mahsulot_obekti.dart';
// import 'package:path/path.dart';
//
// class LocalDatabase {
//   LocalDatabase._init();
//
//   static final LocalDatabase getInstance = LocalDatabase._init();
//
//   factory LocalDatabase() {
//     return getInstance;
//   }
//
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     } else {
//       _database = await _initDB("product.db");
//       return _database!;
//     }
//   }
//
//   Future<Database> _initDB(String dbName) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, dbName);
//     return await openDatabase(path, version: 2, onCreate: _createDB);
//   }
//
//   Future _createDB(Database db, int version) async {
//     debugPrint("-----------------CREATED---------");
//     await db.execute('''
//     CREATE TABLE mahsulot (
//         id INTEGER DEFAULT 0,
//         nomi TEXT NOT NULL,
//         category TEXT NOT NULL,
//         narx REAL DEFAULT 0,
//     );
//     ''');
//        debugPrint("-------DB----------CREATED---------");
//   }
//
//   static Future <Mahsulot> mahsulotQoshish(Mahsulot mahsulot) async {
//     final db = await getInstance.database;
//     final int id = await db.insert('mahsulot', mahsulot.toJson());
//     debugPrint('qoshildi=======');
//     return mahsulot.copyWith(id: id);
//   }
//
//   static Future<Mahsulot> mahsulotOqishId(int id) async {
//     final db = await getInstance.database;
//     final  mahsulotlar = (await db.query('mahsulot',columns: MahsulotFields.values,where: '${MahsulotFields.id}=?',whereArgs: [id]));
//     if(mahsulotlar.isNotEmpty){
//       return Mahsulot.fromJson(mahsulotlar.first);
//     }else{
//       throw  Exception('id:$id topilmadi');
//     }
//   }
//
//   static Future<Mahsulot> oqish(
//       Mahsulot mahsul) async {
//     final db = await getInstance.database;
//     final int id = await db.insert(
//         'mahsulot', mahsul.toJson());
//     return mahsul.copyWith(id: id);
//   }
//
//
//   static mahsulotniOchirish(int id) async {
//     final db = await getInstance.database;
//     int count = await db.delete('mahsulot',
//         where: "${MahsulotFields.id} = ?", whereArgs: [id]);
//     return count;
//   }
//
//   static mahsulotniOzgartir({required Mahsulot mahsulot})async {
//     final db = await getInstance.database;
//     db.update('mahsulot', mahsulot.toJson(),
//     where: "${MahsulotFields.id}=?",
//     whereArgs: [mahsulot.id]);
//   }
// }
