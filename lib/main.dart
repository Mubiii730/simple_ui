import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_ui/Hive_task_assignment.dart';
import 'package:simple_ui/Hive_task_calendar.dart';
import 'package:simple_ui/Map_Example.dart';
import 'package:simple_ui/indexPractice.dart';
import 'package:simple_ui/index_problem.dart';
import 'package:simple_ui/textfield_with_hive.dart';

void main() async{
  //   await Hive.initFlutter();
  //  await Hive.openBox('tasksBox'); 
   
  //await Hive.openBox('myBox'); 
  runApp(
 
   
    const  MaterialApp(

      home: 
      MapExample()
      
    //   theme: ThemeData(
       
    //     primarySwatch: Colors.green,
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   home:MapExample()
    //   // HiveCopy() 
    //   //CrudOps()
    //   //checkCalendar2(startDate: DateTime.now(),)  
    //   //ReorderableApp(),
    //   // home: CopyCalendar(
    //   //   startDate: DateTime.now(),
    //   // ),
     ),
  );
}