class History {
  static final String tableName = 'history';
  static final String columnId = 'id';
  static final String columnTimestamp = 'timestamp';

  int id;
  DateTime timestamp;

  History({this.timestamp});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTimestamp: timestamp.millisecondsSinceEpoch,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  History.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    timestamp = DateTime.fromMillisecondsSinceEpoch(map[columnTimestamp]);
  }
}
