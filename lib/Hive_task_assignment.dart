import 'package:flutter/material.dart';
import 'package:hive/hive.dart';






class CheckCalendar2Hive extends StatefulWidget {
  const CheckCalendar2Hive({super.key, this.startDate});
  final DateTime? startDate;

  @override
  State<CheckCalendar2Hive> createState() => _CheckCalendar2HiveState();
}

class _CheckCalendar2HiveState extends State<CheckCalendar2Hive> {
  DateTime? _currentDate;
  final List<String> monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  final Map<DateTime, List<String>> tasksMap = {};
  final Map<DateTime, TextEditingController> controllersMap = {};

  @override
  void initState() {
    super.initState();
    _currentDate ??= widget.startDate ?? DateTime.now();
    _loadTasks();
  }

  void _loadTasks() {
    var box = Hive.box('tasksBox');
    // tasksMap.clear();
    for (var key in box.keys) {
      DateTime date = DateTime.parse(key);
      // print(date);
      tasksMap[date] = List<String>.from(box.get(key) ?? []);
      //print(tasksMap[date]);
    }
  }

  void _addItem(DateTime date) {
    final controller = controllersMap[date];
    if (controller != null && controller.text.isNotEmpty) {
      setState(() {
        if (!tasksMap.containsKey(date)) {
          tasksMap[date] = [];
        }
        tasksMap[date]!.add(controller.text);
        
        // Store the task in Hive
        var box = Hive.box('tasksBox');
        box.put(date.toString(), tasksMap[date]); // Use date as a key

        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _currentDate ??= DateTime.now();
    var currentDate = _currentDate ?? DateTime.now();
    double size = MediaQuery.of(context).size.width / 50;
    List<List<DateTime>> days = [];

    var startFrom = DateTime(currentDate.year, currentDate.month, 1)
        .subtract(Duration(days: DateTime(currentDate.year, currentDate.month, 1).weekday));

    for (int i = 0; i < 6; i++) {
      List<DateTime> week = [];
      for (int j = 0; j < 7; j++) {
        week.add(startFrom);
        controllersMap[startFrom] = TextEditingController();
        startFrom = startFrom.add(const Duration(days: 1));
      }
      days.add(week);
    }

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final double availableWidth = constraints.maxWidth;
        final double availableHeight = constraints.maxHeight;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: availableWidth / 3.3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _currentDate = DateTime(_currentDate!.year, _currentDate!.month - 1);
                            _loadTasks(); // Load tasks for the new month
                          });
                        },
                        icon: const Icon(Icons.arrow_left),
                      ),
                      Text(
                        '${monthNames[_currentDate!.month - 1]} ${_currentDate!.year}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _currentDate = DateTime(_currentDate!.year, _currentDate!.month + 1);
                            _loadTasks(); // Load tasks for the new month
                          });
                        },
                        icon: const Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ['SU', 'MO', 'TU', 'WE', 'TH', 'FR', 'SA']
                        .map(
                          (x) => Container(
                            height: MediaQuery.of(context).size.height / 20,
                            child: Center(
                              child: Text(
                                x,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: size),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var week in days)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: week.map((date) {
                            return SingleCell1(date: date, currentDate: currentDate);
                          }).toList(),
                        ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: availableWidth - availableWidth / 3,
              height: availableHeight - availableHeight / 12,
              color: Colors.black,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      '${monthNames[_currentDate!.month - 1]} ${_currentDate!.year}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ['SU', 'MO', 'TU', 'WE', 'TH', 'FR', 'SA']
                        .map(
                          (x) => Container(
                            height: MediaQuery.of(context).size.height / 20,
                            child: Center(
                              child: Text(
                                x,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var week in days)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: week.map((date) {
                            return SingleCell(
                              date: date,
                              currentDate: currentDate,
                              tasks: tasksMap[date] ?? [],
                              onAddTask: () => _addItem(date),
                              controller: controllersMap[date]!,
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class SingleCell extends StatelessWidget {
  const SingleCell({
    super.key,
    required this.date,
    required this.currentDate,
    required this.tasks,
    required this.onAddTask,
    required this.controller,
  });

  final DateTime date;
  final DateTime? currentDate;
  final List<String> tasks;
  final VoidCallback onAddTask;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    bool isCurrentMonth = date.year == currentDate!.year && date.month == currentDate!.month;

    return Container(
      width: size / 12,
      color: isCurrentMonth ? Colors.blue : Colors.grey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            ...tasks.map((task) => Text(
              task,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            )),
            SizedBox(
              width: 100,
              height: 35,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: 'Enter Task',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onAddTask,
              style: ElevatedButton.styleFrom(fixedSize: const Size(120, 20)),
              child: const Text('Add', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleCell1 extends StatelessWidget {
  const SingleCell1({
    super.key,
    required this.date,
    required this.currentDate,
  });

  final DateTime date;
  final DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    bool isCurrentMonth = date.year == currentDate.year && date.month == currentDate.month;

    return Container(
      width: size / 25,
      color: isCurrentMonth ? Colors.blue : Colors.grey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}