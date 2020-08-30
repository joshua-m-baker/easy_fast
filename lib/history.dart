import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'dbProvider.dart';
import 'historyModel.dart';

class HistoryState extends ChangeNotifier with HistoryStorageProvider {
  List<History> _history;
  List<History> get history => _history;
  int get length => _history != null ? _history.length : 0;

  Future _initFuture;
  Future get initializationDone => _initFuture;
  //History get mostRecent => _history.last;

  Future _init() async {
    await super.open();
    _history = await super.getAll();
  }

  HistoryState() {
    _initFuture = _init();
  }

  void newEntry() async {
    //_history.add(DateTime.now());
    History newHistory = new History(timestamp: DateTime.now());
    await super.insert(newHistory);
    _history.add(newHistory);

    notifyListeners();
  }

  void deleteEntry(int id) {
    super.delete(id);
    notifyListeners();
  }

  History atIndex(int index) {
    return _history[index];
  }

  String displayLast() {
    if (_history != null && _history.length != 0) {
      return DateFormat("hh:mm").format(_history.last.timestamp);
    }
    return '';
  }
}
