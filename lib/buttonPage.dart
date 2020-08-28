import 'package:easy_fast/history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({ Key key, this.history }) : super(key: key);

  final EatingHistory history;

  @override
  _MyButtonPageState createState() => _MyButtonPageState();
}

class _MyButtonPageState extends State<ButtonPage> {
  DateTime time = new DateTime.now();

  void _incrementCounter() {
    setState(() {
      widget.history.newEntry();
      time = widget.history.lastEntry();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Last Ate: ' + DateFormat("hh:mm").format(time),
            style: Theme.of(context).textTheme.headline4,
          ),
            MaterialButton(
              onPressed: _incrementCounter,
              color: Colors.blue,
              textColor: Colors.white,
              child: Icon(
                Icons.fastfood,
                  size: MediaQuery.of(context).size.width*.50,
              ),
              padding: EdgeInsets.all(30),
              shape: CircleBorder(),
            ),


          
          // RawMaterialButton(
          //   onPressed: _incrementCounter,
          //   elevation: 2.0,
          //   fillColor: Colors.green,
          //   child: Icon(
          //     Icons.fastfood,
          //     size: 35.0,
          //   ),
          //   shape: CircleBorder(),
          //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // ),
        ],
      ),
    );
  }
}