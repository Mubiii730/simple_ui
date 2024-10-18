import 'package:flutter/material.dart';

class CopyCalendar extends StatefulWidget {
  const CopyCalendar({super.key, this.startDate});
  final DateTime? startDate;

  @override
  State<CopyCalendar> createState() => _CopyCalendarState();
}

class _CopyCalendarState extends State<CopyCalendar> {
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

  DateTime getStartOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  @override
  Widget build(BuildContext context) {
    _currentDate ??= widget.startDate;
    var currentDate = _currentDate ?? DateTime.now();

    var startFrom = getStartOfMonth(currentDate)
        .subtract(Duration(days: getStartOfMonth(currentDate).weekday - 1));

    List<List<DateTime>> days = [];

    if(startFrom.day>27){
      for (var i = 0; i < 5; i++) {
      var list = <DateTime>[];

      for (var j = 0; j < 7; j++) {
        list.add(startFrom);
        startFrom = startFrom.add(Duration(days: 1));
      }
      days.add(list);
    }
    }
     else if(startFrom.day<=27 && startFrom.day>7){
      for (var i = 0; i < 6; i++) {
      var list = <DateTime>[];

      for (var j = 0; j < 7; j++) {
        list.add(startFrom);
        startFrom = startFrom.add(Duration(days: 1));
      }
      days.add(list);
    }
    }
     else{
      for (var i = 0; i < 5; i++) {
      var list = <DateTime>[];

      for (var j = 0; j < 7; j++) {
        list.add(startFrom);
        startFrom = startFrom.add(Duration(days: 1));
      }
      days.add(list);
    }
    }


    

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                monthNames[currentDate.month - 1] + ' ' + '${currentDate.year}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Container(
              color: Colors.amber[900],
              height: 400,
              width: MediaQuery.sizeOf(context).width - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                          .map(
                            (x) => Container(
                              height: 60,
                              child: Center(
                                child: Text(
                                  x,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  for (int i = 0; i < days.length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int j = 0; j < days[i].length; j++)
                          Container(
                            width: 40,
                            height: 40,
                            child: SingleCell(
                              date: days[i][j],
                              currentDate: currentDate,
                            ),
                          ),
                      ],
                    )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _currentDate = DateTime(
                            _currentDate!.year, _currentDate!.month - 1);
                      });
                    },
                    icon: Icon(Icons.arrow_left)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _currentDate = DateTime(
                            _currentDate!.year, _currentDate!.month + 1);
                      });
                    },
                    icon: Icon(Icons.arrow_right))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SingleCell extends StatelessWidget {
  const SingleCell({super.key, this.date, required this.currentDate});
  final DateTime? date;
  final DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

   
    bool isCurrentMonth = date!.year == currentDate.year && date!.month == currentDate.month;

    return Container(
      width: size / 8,
      color: isCurrentMonth ? Colors.black : Colors.blue, 
      child: Center(
        child: Text(
          date!.day.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
