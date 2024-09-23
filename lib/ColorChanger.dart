import 'dart:math';

import 'package:flutter/material.dart';

class TheColorChanger extends StatefulWidget {
  const TheColorChanger({super.key});

  @override
  State<TheColorChanger> createState() => _TheColorChangerState();
}

class _TheColorChangerState extends State<TheColorChanger> {
  var controllingArray = [
    [Colors.red, Colors.green, Colors.blue],
    [Colors.yellow, Colors.purple, Colors.orange],
    [Colors.pink, Colors.teal, Colors.indigo],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < controllingArray.length; i++)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int j = 0; j < controllingArray[i].length; j++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          controllingArray[i][j] = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(3),
                        width: 40,
                        height: 40,
                        color: controllingArray[i][j],
                      ),
                    ),
                ],
              ),
            ),
          SizedBox(height: 20),
          for (int i = 0; i < controllingArray.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int j = 0; j < controllingArray[i].length; j++)
                  Container(
                    margin: EdgeInsets.all(3),
                    width: 100,
                    height: 100,
                    color: controllingArray[i][j],
                  ),
              ],
            )
        ],
      ),
    );
  }
}