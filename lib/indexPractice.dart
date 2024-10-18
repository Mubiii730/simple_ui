import 'package:flutter/material.dart';

class Indexpractice extends StatefulWidget {
  const Indexpractice({super.key});

  @override
  State<Indexpractice> createState() => _IndexpracticeState();
}

class _IndexpracticeState extends State<Indexpractice> {
  final List<TextEditingController> _controllers = List.generate(5, (x) => TextEditingController());

  void addItems() {
    for (int i = 0; i < _controllers.length; i++) {
      print('Input from TextField ${i + 1}: ${_controllers[i].text}');
      _controllers[i].clear(); // Clear the text field after printing
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice for Indexes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++) 
              SizedBox(
                width: width - 200,
                child: TextField(
                  controller: _controllers[i],
                  decoration: const InputDecoration(
                    hintText: 'Enter the text',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: addItems, 
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
