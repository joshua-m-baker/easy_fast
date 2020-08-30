import 'package:easy_fast/models/eatingRecord.dart';
import 'package:easy_fast/providers/eatingRecordProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TimeDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EatingRecordProvider>(
      builder: (context, provider, _) {
        return getDisplay(provider.getLastRecord());
      },
    );
  }

  getDisplay(Future data) {
    return FutureBuilder<EatingRecord>(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<EatingRecord> snapshot) {
          List<Widget> children;

          if (snapshot.hasData) {
            String lastEaten =
                DateFormat("hh:mm").format(snapshot.data.timestamp);
            children = <Widget>[
              Text(
                "Last Eaten: " + lastEaten,
                style: Theme.of(context).textTheme.headline4,
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[Text("Error retrieving last meal data")];
          } else {
            children = <Widget>[
              Text(
                "Last Eaten: ???",
                style: Theme.of(context).textTheme.headline4,
              )
            ];
          }
          return Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        });
  }
}

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TimeDisplay(),
          MaterialButton(
            onPressed: () {
              EatingRecord er = new EatingRecord(timestamp: DateTime.now());
              Provider.of<EatingRecordProvider>(context, listen: false)
                  .insert(er);
            },
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
