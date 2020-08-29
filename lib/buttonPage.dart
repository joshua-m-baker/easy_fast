import 'package:easy_fast/history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<HistoryState>(
            builder: (context, history, child) {
              return Text(
                'Last Ate: ' + history.displayLast(),
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
          MaterialButton(
            onPressed:
                Provider.of<HistoryState>(context, listen: false).newEntry,
            color: Colors.blue,
            textColor: Colors.white,
            child: Icon(
              Icons.fastfood,
              size: MediaQuery.of(context).size.width * .50,
            ),
            padding: EdgeInsets.all(30),
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }
}
