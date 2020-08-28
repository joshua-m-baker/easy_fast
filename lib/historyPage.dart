import 'package:flutter/material.dart';

import 'history.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({ Key key, this.history }) : super(key: key);

  final EatingHistory history;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: history.length(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: Text('Entry ${history.atIndex(index)}')),
        );
      }
    );
  }
}


