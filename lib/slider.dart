import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        
        title: const Text('Slider', style: TextStyle(color: Colors.amber)),
        backgroundColor: Colors.brown,
        centerTitle: true,
        
        
      ),
      body: Slider(
        value: _currentSliderValue,
        max: 100,
        divisions:10,
        label: _currentSliderValue.round().toString(),
       onChanged: (x){
        setState(() {
          _currentSliderValue=x;
        });
       }),

    );
  }
}