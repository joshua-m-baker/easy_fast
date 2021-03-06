import 'package:easy_fast/models/eatingRecordDao.dart';
import 'package:easy_fast/models/scheduleDao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final _instance = DatabaseProvider._internal();
  static DatabaseProvider get = _instance;
  bool isInitialized = false;
  final String dbName = 'easy_fast.db';
  Database _db;

  //singleton pattern
  factory DatabaseProvider() {
    return _instance;
  }

  DatabaseProvider._internal();

  Future<Database> db() async {
    if (!isInitialized) await _init();
    return _db;
  }

  Future _init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(EatingRecordDao().createTableQuery);
      await db.execute(ScheduleDao().createTableQuery);
    });
    isInitialized = true;
  }
}
