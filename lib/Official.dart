import 'dart:math';

import 'package:flutter/material.dart';

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  var controllingArray=[
    [Colors.red, Colors.green, Colors.blue],
    [Colors.pink, Colors.purple, Colors.orange],
    [Colors.teal, Colors.amber, Colors.amber[900]]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(int i=0; i<controllingArray.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int j=0; j<controllingArray[i].length; j++)
             
              InkWell(onTap: (){
                setState(() {
                  controllingArray[i][j]=Colors.primaries[Random().nextInt(Colors.primaries.length)];
                });
              },
              child: Container(
                margin: EdgeInsets.all(3),
                width: 40,
                height: 40,
                color: controllingArray[i][j],
              )
              )
            ],
          ),

          SizedBox(height: 20,),
          for(int i=0;i<controllingArray.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int j=0; j<controllingArray[i].length; j++)
               InkWell(onTap: (){
                setState(() {
                  controllingArray[i][j]=Colors.primaries[Random().nextInt(Colors.primaries.length)];
                });
              },
              child: Container(
                margin: EdgeInsets.all(3),
                width: 100,
                height: 100,
                color: controllingArray[i][j],
              )
              )
              
            ],
          )

        ],

      ),



    );

  }
}