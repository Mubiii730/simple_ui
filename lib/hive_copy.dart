import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class Map_new extends StatelessWidget {
   Map_new({super.key});
   Map<String, int>ages={'Alice':24, 'Bob':23, 'Charlie':26};
  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.green,
        statusBarIconBrightness: Brightness.light,
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Map() method example'),
      ),

      body: Container(
        child: Column(
          children: [

            if(ages.containsKey('Bob'))
            ...{
               Text('Alice is ${ages['Alice']} years old'),
            Text('Bob is ${ages['Bob']} years old'), 
            Text('Charlie is ${ages['Charlie']} years old'),
            
            
            },
            
           

          ],
        ),
      )
    );
  }
}