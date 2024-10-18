import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Index Access Example',
      home: IndexAccessScreen(),
    );
  }
}

class IndexAccessScreen extends StatefulWidget {
  @override
  _IndexAccessScreenState createState() => _IndexAccessScreenState();
}

class _IndexAccessScreenState extends State<IndexAccessScreen> {
  final List<String> items = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];
  String displayText = '';
  final TextEditingController indexController = TextEditingController();

  void _getItemAtIndex() {
    final index = int.tryParse(indexController.text);

    if (index != null && index >= 0 && index < items.length) {
      setState(() {
        displayText = items[index];
      });
    } else {
      setState(() {
        displayText = 'Invalid index. Please enter a number between 0 and ${items.length - 1}.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Index Access Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: indexController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter an index (0-${items.length - 1})'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getItemAtIndex,
              child: Text('Get Item'),
            ),
            SizedBox(height: 20),
            Text(displayText, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
