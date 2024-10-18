import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();
  final Box _box = Hive.box('myBox');

  void _saveInput() {
    String input = _controller.text;
    List<String> inputs=_box.get('userInputs', defaultValue: <String>[]);

    inputs.add(input);
    _box.put('userInput', inputs);
    _controller.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Input Saved!!!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive input example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter Something'),
            ),
           const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _saveInput, child: Text('Save to hive')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                 List< String> SavedInputs =
                      _box.get('userInputs', defaultValue: <String>[]);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('Saved Input'),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ListView.builder(
                                itemCount: SavedInputs.length,
                                itemBuilder:(context, index){
                                  return ListTile(
                                    title: Text(SavedInputs[index]),
                                  );
                                } ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child:const Text('Ok'),
                              ),
                            ],
                          ));
                },
                child:const Text('Show Saved Input'))
          ],
        ),
      ),
    );
  }
}
