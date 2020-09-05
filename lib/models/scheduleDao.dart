import 'package:easy_fast/models/dao.dart';
import 'package:easy_fast/models/schedule.dart';
import 'package:flutter/material.dart';

class ScheduleDao implements Dao<Schedule> {
  static final String tableName = 'schedule';
  static final String columnId = 'id';
  static final String columnStartHour = 'startHr';
  static final String columnStartMinute = 'startMn';

  static final String columnStopHour = 'stopHr';
  static final String columnStopMinute = 'stopMn';

  @override
  String get createTableQuery => '''CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnStartHour INTEGER NOT NULL,
            $columnStartMinute INTEGER NOT NULL,
            $columnStopHour INTEGER NOT NULL,
            $columnStopMinute INTEGER NOT NULL)
          ''';

  Map<String, dynamic> toMap(Schedule schedule) {
    var map = <String, dynamic>{
      columnStartHour: schedule.startTime.hour,
      columnStartHour: schedule.startTime.minute,
      columnStopHour: schedule.endTime.hour,
      columnStopMinute: schedule.endTime.minute
    };
    if (schedule.id != null) {
      map[columnId] = schedule.id;
    }
    return map;
  }

  Schedule fromMap(Map<String, dynamic> scheduleMap) {
    Schedule record = new Schedule();
    record.id = scheduleMap[columnId];
    record.startTime = TimeOfDay(
        hour: scheduleMap[columnStartHour],
        minute: scheduleMap[columnStartMinute]);
    record.endTime = TimeOfDay(
        hour: scheduleMap[columnStopHour],
        minute: scheduleMap[columnStopMinute]);
    return record;
  }

  @override
  List<Schedule> fromList(List<Map<String, dynamic>> query) {
    List<Schedule> records = List<Schedule>();
    for (Map map in query) {
      records.add(fromMap(map));
    }
    return records;
  }
}
