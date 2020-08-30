import 'package:easy_fast/models/eatingRecord.dart';
import 'package:easy_fast/models/eatingRecordDao.dart';
import 'package:easy_fast/providers/databaseProvider.dart';
import 'package:flutter/foundation.dart';

class EatingRecordProvider extends ChangeNotifier {
  final dao = EatingRecordDao();

  DatabaseProvider databaseProvider;
  EatingRecordProvider(this.databaseProvider);

  Future<EatingRecord> insert(EatingRecord record) async {
    final db = await databaseProvider.db();
    record.id = await db.insert(EatingRecordDao.tableName, dao.toMap(record));
    notifyListeners();
    return record;
  }

  Future<EatingRecord> delete(EatingRecord record) async {
    final db = await databaseProvider.db();
    await db.delete(EatingRecordDao.tableName,
        where: EatingRecordDao.columnId + " = ?", whereArgs: [record.id]);
    notifyListeners();

    return record;
  }

  Future<List<EatingRecord>> getRecords() async {
    final db = await databaseProvider.db();
    List<Map> maps = await db.query(EatingRecordDao.tableName);
    return dao.fromList(maps);
  }

  Future<EatingRecord> getLastRecord() async {
    final db = await databaseProvider.db();
    // SELECT * FROM table ORDER BY column DESC LIMIT 1;
    List<Map> maps = await db.query(EatingRecordDao.tableName,
        orderBy: EatingRecordDao.columnId + " DESC", limit: 1);
    if (maps.length > 0) {
      return dao.fromMap(maps.first);
    }

    return null;
  }

  // Future<Todo> getTodo(int id) async {
  //   List<Map> maps = await db.query(tableTodo,
  //       columns: [columnId, columnDone, columnTitle],
  //       where: '$columnId = ?',
  //       whereArgs: [id]);
  //   if (maps.length > 0) {
  //     return Todo.fromMap(maps.first);
  //   }
  //   return null;
  // }
}
