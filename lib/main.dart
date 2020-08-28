import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Fast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  final List presses = [];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime time = new DateTime.now();

  void _incrementCounter() {
    setState(() {
      time = new DateTime.now();
      widget.presses.add(time);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Fasting"),
      ),
      body: Center(
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
      ),
    );
  }
}
