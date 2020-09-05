import 'package:easy_fast/models/schedule.dart';
import 'package:easy_fast/models/scheduleDao.dart';
import 'package:easy_fast/providers/databaseProvider.dart';
import 'package:flutter/foundation.dart';

class ScheduleProvider extends ChangeNotifier {
  final dao = ScheduleDao();

  DatabaseProvider databaseProvider;
  ScheduleProvider(this.databaseProvider);

  Future<Schedule> insert(Schedule record) async {
    final db = await databaseProvider.db();
    record.id = await db.insert(ScheduleDao.tableName, dao.toMap(record));
    notifyListeners();
    return record;
  }

  Future<Schedule> delete(Schedule record) async {
    final db = await databaseProvider.db();
    await db.delete(ScheduleDao.tableName,
        where: ScheduleDao.columnId + " = ?", whereArgs: [record.id]);
    notifyListeners();

    return record;
  }

  Future<Schedule> deleteById(int id) async {
    final db = await databaseProvider.db();
    await db.delete(ScheduleDao.tableName,
        where: ScheduleDao.columnId + " = ?", whereArgs: [id]);
    notifyListeners();
    return Future(null);
  }

  Future<List<Schedule>> getRecords() async {
    final db = await databaseProvider.db();
    List<Map> maps = await db.query(ScheduleDao.tableName);
    return dao.fromList(maps);
  }

  Future<Schedule> getLastRecord() async {
    final db = await databaseProvider.db();
    // SELECT * FROM table ORDER BY column DESC LIMIT 1;
    List<Map> maps = await db.query(ScheduleDao.tableName,
        orderBy: ScheduleDao.columnId + " DESC", limit: 1);
    if (maps.length > 0) {
      return dao.fromMap(maps.first);
    }

    return null;
  }
}
