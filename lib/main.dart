import 'package:flutter/material.dart';


import 'package:simple_ui/Task_Assignment_calendar.dart';

void main() {
  runApp(
    MaterialApp(
      home: CheckCalendar(startDate: DateTime.now(),)  
      //ReorderableApp(),
      // home: CopyCalendar(
      //   startDate: DateTime.now(),
      // ),
    ),
  );
}