import 'package:flutter/material.dart';

class NewCalendar extends StatefulWidget {
  const NewCalendar({super.key, this.startDate});
  final DateTime? startDate;
  

  @override
  State<NewCalendar> createState() => _NewCalendarState();
}

class _NewCalendarState extends State<NewCalendar> {
  DateTime? _currentDate;
 

  var monthNames = ['Jan', 'Feb', 'Mar', 'April', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  DateTime getStartOfMonth (DateTime date){
    return DateTime(date.year , date.month,1);
  }

  @override
  Widget build(BuildContext context) {
    List<List<DateTime>> days = [];

    _currentDate ??= widget.startDate;
    
    

    var currentDate = _currentDate ?? DateTime.now();
    
    
    var startFrom = getStartOfMonth(currentDate).subtract(
      Duration(
        days: getStartOfMonth(currentDate).weekday -3,
      ),
    );

    for (var i = 0; i < 5; i++) {
      var list = <DateTime>[];
      for (var j = 0; j < 7; j++) {
        list.add(startFrom);
        startFrom = startFrom.add(const Duration(days: 1));
      }
      days.add(list);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  monthNames[_currentDate!.month - 1] + ' ' + '${_currentDate!.year}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Container(
              child: Column(
                // border: TableBorder.all(width: 0.2),
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                          .map(
                            (x) => Container(
                              height: 40,
                              
                              child: Center(
                                  child: Text(
                                x,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                          .toList()),
                  for (int i = 0; i < days.length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int j = 0; j < days[i].length; j++)
                          SingleCell(
                            date: days[i][j],
                            selectedMonth: _currentDate!.month,
                          ),
                      ],
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentDate = _currentDate?.subtract(Duration(days: 30));
                        });
                      },
                      icon: Icon(Icons.arrow_left)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _currentDate = _currentDate?.add(Duration(days: 30));
                        });
                      },
                      icon: Icon(Icons.arrow_right)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleCell extends StatelessWidget {
  const SingleCell({super.key, required this.date, required this.selectedMonth});

  final DateTime date;
  final int selectedMonth; 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    
    return Container(
      
      width: size /8,
      child: Text(date.day.toString()),);
  }
}