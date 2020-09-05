import 'package:flutter/material.dart';

class SchedulePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("Start Eating Time"),
          onPressed: () async {
            TimeOfDay selectedTime = await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
            );
            if (selectedTime != null) {
              print(selectedTime.hour.toString());
            }
          },
        ),
        RaisedButton(
          child: Text("Stop Eating Time"),
          onPressed: () async {
            TimeOfDay selectedTime = await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
            );
            if (selectedTime != null) {
              print(selectedTime.toString());
            }
          },
        )
      ],
    );
  }
}
