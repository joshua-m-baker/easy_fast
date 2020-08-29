import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'history.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryState>(builder: (context, history, _) {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: history.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Center(
                  child: Text('Entry ${history.atIndex(index).timestamp}')),
            );
          });
    });
  }
}
