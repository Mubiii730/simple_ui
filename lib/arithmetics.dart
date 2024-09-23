import 'dart:math';
import 'package:flutter/material.dart';

class Arithmetics_Examples extends StatefulWidget {
  const Arithmetics_Examples({super.key});

  @override
  State<Arithmetics_Examples> createState() => _Arithmetics_ExamplesState();
}

class _Arithmetics_ExamplesState extends State<Arithmetics_Examples> {
  double _currentSliderValue = 7;

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Slider(
              value: _currentSliderValue,
              min: 2,
              max: 10,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
          for (int i = 0; i < _currentSliderValue; i++)
            if (i == 0)
              Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.all(5),
                color: Colors.teal,
              )
            else if (i < _currentSliderValue ~/ 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(5),
                    color: Colors.teal,
                  ),
                  for (int j = 0; j < i; j++)
                    SizedBox(
                      width: 60,
                    ),
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(5),
                    color: Colors.teal,
                  ),
                ],
              )
            else if (i >= _currentSliderValue ~/ 2 && i < _currentSliderValue-1 )

              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.all(5),
                      color: Colors.teal,
                    ),
                  for (int k = i; k < _currentSliderValue-1; k++)
                    
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(5),
                    color: Colors.teal,
                  ),
                ],
              )
            else 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(5),
                    color: Colors.teal,
                  ),
                ],
              )
        ],
      ),
    );
  }
}
