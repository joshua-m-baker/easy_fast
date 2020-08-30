import 'package:easy_fast/models/dao.dart';
import 'package:easy_fast/models/eatingRecord.dart';

class EatingRecordDao implements Dao<EatingRecord> {
  static final String dbName = 'easy_fast.db';
  static final String tableName = 'history';
  static final String columnId = 'id';
  static final String columnTimestamp = 'timestamp';

  @override
  String get createTableQuery => '''CREATE TABLE $tableName ( 
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT, 
            $columnTimestamp INTEGER NOT NULL)
          ''';

  Map<String, dynamic> toMap(EatingRecord record) {
    var map = <String, dynamic>{
      columnTimestamp: record.timestamp.millisecondsSinceEpoch,
    };
    if (record.id != null) {
      map[columnId] = record.id;
    }
    return map;
  }

  EatingRecord fromMap(Map<String, dynamic> recordMap) {
    EatingRecord record = new EatingRecord();
    record.id = recordMap[columnId];
    record.timestamp =
        DateTime.fromMillisecondsSinceEpoch(recordMap[columnTimestamp]);
    return record;
  }

  @override
  List<EatingRecord> fromList(List<Map<String, dynamic>> query) {
    List<EatingRecord> records = List<EatingRecord>();
    for (Map map in query) {
      records.add(fromMap(map));
    }
    return records;
  }
}
