import 'dart:collection';

import 'package:flutter/foundation.dart';

class HistoryModel extends ChangeNotifier {
  final List<DateTime> _history = [DateTime.now()];
  UnmodifiableListView<DateTime> get history => UnmodifiableListView(_history);

  DateTime get mostRecent => _history.last;

  void newEntry() {
    _history.add(DateTime.now());
    notifyListeners();
  }

  DateTime atIndex(int index) {
    return _history[index];
  }
}

// class EatingHistory {
//   List<DateTime> history = [];

//   newEntry() {
//     history.add(DateTime.now());
//   }

//   DateTime lastEntry() {
//     return history.last;
//   }

//   int length() {
//     return history.length;
//   }

//   DateTime atIndex(int index) {
//     return history[index];
//   }
// }
