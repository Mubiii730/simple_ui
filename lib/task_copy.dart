import 'package:flutter/material.dart';

class checkCalendar2 extends StatefulWidget {
  const checkCalendar2({super.key, this.startDate});
  final DateTime? startDate;

  @override
  State<checkCalendar2> createState() => _checkCalendar2State();
}

class _checkCalendar2State extends State<checkCalendar2> {
  DateTime? _currentDate;

  var monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'April',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  getStartOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  Map<DateTime, List<String>> tasksMap = {};
  Map<DateTime, TextEditingController> controllersMap = {};

  void _addItem(DateTime date) {
    final controller = controllersMap[date];
    if (controller != null && controller.text.isNotEmpty) {
      setState(() {
        if (!tasksMap.containsKey(date)) {
          tasksMap[date] = [];
        }
        tasksMap[date]!.add(controller.text);
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _currentDate ??= widget.startDate??DateTime.now();

    var currentDate = _currentDate ?? DateTime.now();
    double size = MediaQuery.sizeOf(context).width / 50;
    List<List<DateTime>> days = [];

    var startFrom = getStartOfMonth(currentDate).subtract(Duration(
      days: getStartOfMonth(currentDate).weekday,
    ));
    var startFrom_later=startFrom;
    if (startFrom.day > 27 || startFrom.day <= 7)
      for (var i = 0; i < 5; i++) {
        var list = <DateTime>[];
        for (var j = 0; j < 7; j++) {
          list.add(startFrom);
          controllersMap[startFrom] = TextEditingController();
          startFrom = startFrom.add(const Duration(days: 1));
        }
        days.add(list);
      }
    else {
      for (var i = 0; i < 6; i++) {
        var list = <DateTime>[];
        for (var j = 0; j < 7; j++) {
          list.add(startFrom);
          controllersMap[startFrom] = TextEditingController();
          startFrom = startFrom.add(const Duration(days: 1));
        }
        days.add(list);
      }
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
                            _currentDate = DateTime(
                                _currentDate!.year, _currentDate!.month - 1);
                          });
                        },
                        icon: Icon(Icons.arrow_left),
                      ),
                      Text(
                        monthNames[_currentDate!.month - 1] +
                            ' ' +
                            '${_currentDate!.year}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _currentDate = DateTime(
                                _currentDate!.year, _currentDate!.month + 1);
                          });
                        },
                        icon: Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ['SU', 'MO', 'TU', 'WE', 'TH', 'FR', 'SA']
                        .map(
                          (x) => Container(
                            height: MediaQuery.sizeOf(context).height / 20,
                            child: Center(
                              child: Text(
                                x,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < days.length; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int j = 0; j < days[i].length; j++)
                              SingleCell1(
                                date: days[i][j],
                                currentDate: currentDate,
                              )
                          ],
                        )
                    ],
                  )
                ],
              ),
            ),
            if (startFrom_later.day > 27 || startFrom_later.day <= 7)
              Container(
                width: availableWidth - availableWidth / 3,
                height: availableHeight - availableHeight / 12,
                color: Colors.black,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        monthNames[_currentDate!.month - 1] +
                            ' ' +
                            '${_currentDate!.year}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['SU', 'MO', 'TU', 'WE', 'TH', 'FR', 'SA']
                          .map(
                            (x) => Container(
                              height: MediaQuery.sizeOf(context).height / 20,
                              child: Center(
                                child: Text(
                                  x,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (startFrom.day > 27 || startFrom.day <= 7)
                          for (int i = 0; i < 5; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int j = 0; j < 7; j++)
                                  Column(
                                    children: [
                                      Container(
                                          width: availableWidth / 12,
                                          height: availableHeight / 7,
                                          color: Colors.blue,
                                          child: Column(
                                            children: [
                                              SingleCell(
                                                date: days[i][j],
                                                currentDate: currentDate,
                                                tasks:
                                                    tasksMap[days[i][j]] ?? [],
                                                onAddTask: () =>
                                                    _addItem(days[i][j]),
                                                controller:
                                                    controllersMap[days[i][j]]!,
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  )
                              ],
                            )
                      ],
                    ),
                  ],
                ),
              )
            else
              Container(
                width: availableWidth - availableWidth / 3,
                height: availableHeight - availableHeight / 12,
                color: Colors.black,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        monthNames[_currentDate!.month - 1] +
                            ' ' +
                            '${_currentDate!.year}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['SU', 'MO', 'TU', 'WE', 'TH', 'FR', 'SA']
                          .map(
                            (x) => Container(
                              height: MediaQuery.sizeOf(context).height / 20,
                              child: Center(
                                child: Text(
                                  x,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 6; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int j = 0; j < 7; j++)
                                Column(
                                  children: [
                                    Container(
                                        width: availableWidth / 12,
                                        height: availableHeight / (8.5),
                                        color: Colors.blue,
                                        child: Column(
                                          children: [
                                            SingleCell(
                                              date: days[i][j],
                                              currentDate: currentDate,
                                              tasks: tasksMap[days[i][j]] ?? [],
                                              onAddTask: () =>
                                                  _addItem(days[i][j]),
                                              controller:
                                                  controllersMap[days[i][j]]!,
                                            ),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                )
                            ],
                          )
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
    this.currentDate,
    required this.tasks,
    required this.onAddTask,
    required this.controller,
  });

  final DateTime date;
  final currentDate;
  final List<String> tasks;
  final VoidCallback onAddTask;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    bool isCurrentMonth =
        date.year == currentDate.year && date.month == currentDate.month;

    return Container(
      width: size / 20,
      color: isCurrentMonth ? Colors.blue : Colors.grey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: TextStyle(color: Colors.white),
            ),
            ...tasks.map((task) => Text(
                  task,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )),
            SizedBox(
              width: 100,
              height: 35,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                  hintText: 'Enter Task',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onAddTask,
              style: ElevatedButton.styleFrom(fixedSize: Size(120, 20)),
              child: Text(
                'Add ',
                style: TextStyle(fontSize: 12),
              ),
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
    this.currentDate,
  });

  final DateTime date;
  final currentDate;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    bool isCurrentMonth =
        date.year == currentDate.year && date.month == currentDate.month;

    return Container(
      width: size / 25,
      color: isCurrentMonth ? Colors.blue : Colors.grey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}