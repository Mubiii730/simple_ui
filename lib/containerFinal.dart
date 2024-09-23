import 'dart:math';
import 'package:flutter/material.dart';

class ContainerfinalV2 extends StatefulWidget {
  const ContainerfinalV2({super.key});

  @override
  _ContainerfinalV2State createState() => _ContainerfinalV2State();
}

class _ContainerfinalV2State extends State<ContainerfinalV2> {
  double _currentSliderValue =13;
  // final int horizontally = 20;
  // final int vertically = 15;

  double calculateDistance(int x1, int y1, int x2, int y2) {
    var deltaX = x2 - x1;
    var deltaY = y2 - y1;
    return sqrt((deltaX * deltaX) + (deltaY * deltaY));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    for (var i = 0; i < _currentSliderValue; i++) {
      var currentRow = <Widget>[];

      for (var j = 0; j < _currentSliderValue; j++) {
        var distanceFromCenter = calculateDistance(i, j, _currentSliderValue ~/ 2, _currentSliderValue ~/ 2);
        currentRow.add(
          SizedBox(
            width: (_currentSliderValue*3 - (distanceFromCenter * 2.1)).abs(),
            height: (_currentSliderValue*3 - (distanceFromCenter * 2.1)).abs(),
            child: Container(
              margin: EdgeInsets.all(3),
              color: Colors.green[700],
            ),
          ),
        );
      }
      list.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: currentRow,
        ),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Slider(
              value: _currentSliderValue,
              min: 9,
              max: 14,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
          ...list,
        ],
      ),
    );
  }
}