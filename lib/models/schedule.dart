import 'package:flutter/material.dart';

class Schedule {
  int id;
  TimeOfDay startTime;
  TimeOfDay endTime;

  Schedule({this.startTime, this.endTime});
}
