import 'package:flutter/material.dart';

class DateTextFieldExample extends StatefulWidget {
  @override
  _DateTextFieldExampleState createState() => _DateTextFieldExampleState();
}

class _DateTextFieldExampleState extends State<DateTextFieldExample> {
  final Map<DateTime, TextEditingController> controllersMap = {};

  @override
  void initState() {
    super.initState();

    // Adding some entries to the map
    controllersMap[DateTime(2023, 10, 01)] = TextEditingController();
    controllersMap[DateTime(2023, 10, 02)] = TextEditingController();
    controllersMap[DateTime(2023, 10, 03)] = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose of each TextEditingController
    for (var controller in controllersMap.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Text Field Example'),
      ),
      body: ListView(
        children: controllersMap.entries.map((entry) {
          DateTime date = entry.key;
          TextEditingController controller = entry.value;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Input for ${date.toLocal().toString().split(' ')[0]}',
                border: OutlineInputBorder(),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DateTextFieldExample(),
  ));
}
