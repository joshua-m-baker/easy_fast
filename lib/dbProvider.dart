import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'historyModel.dart';

mixin HistoryStorageProvider {
  Database db;

  Future open() async {
    String path = join(await getDatabasesPath(), 'easy_fast.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          create table history ( 
            id integer primary key autoincrement, 
            timestamp integer not null)
          ''');
    });
  }

  Future<List<History>> getAll() async {
    List<Map> results = await db.query(History.tableName);
    if (results != null && results.length > 0) {
      return results.map((x) => History.fromMap(x)).toList();
    }
    return [];
  }

  Future<History> insert(History history) async {
    history.id = await db.insert(History.tableName, history.toMap());
    return history;
  }

  Future<int> delete(int id) async {
    return await db.delete(History.tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future close() async => db.close();
}
