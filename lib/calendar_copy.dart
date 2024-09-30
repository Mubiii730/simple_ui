import 'package:flutter/material.dart';


class CalendarCopy extends StatefulWidget {
  const CalendarCopy({super.key, this.startDate});
  final DateTime? startDate;

  @override
  State<CalendarCopy> createState() => _CalendarCopyState();
}

class _CalendarCopyState extends State<CalendarCopy> {

  DateTime? _currentDate;
   var monthNames = ['Jan', 'Feb', 'Mar', 'April', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
   DateTime getStartOfMonth(DateTime date){
    return DateTime(date.year, date.month, 1);
   }

  @override
  Widget build(BuildContext context) {
    List<List<DateTime>> days=[];

    _currentDate??= widget.startDate;

    var currentDate=_currentDate?? DateTime.now();

    var startFrom=getStartOfMonth(currentDate).subtract(
      Duration(
        days: getStartOfMonth(currentDate).weekday-3,
      )
    );

    for (var i = 0; i < 5; i++) {
      var list=<DateTime> [];
      for (var j = 0; i < 7; j++) {
        list.add(startFrom);
        startFrom=startFrom.add(Duration(days: 1));
      }
      days.add(list);
      
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Text(monthNames[_currentDate!.month-1]+ ' '+'${_currentDate!.year}'),

          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sat'].map(
                    (x)=>Container(
                      height: 40,
                      child: Text(x),
                    )
                  ).toList(),
                ),
                for(int i=0; i<days.length; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int j=0; j<days[i].length;j++)
                    SingleCell(date: days[i][j], selectedMonth: _currentDate!.month)
                  ],
                )


              ],
            ),
          )
        ],

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
    var size=MediaQuery.of(context).size.width;
    return Container(
      width: size/8,
      child: Text(date.day.toString()),
    );
  }
}