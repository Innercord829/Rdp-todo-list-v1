import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  final List<String> tasks = <String>['test'];

  final List<bool> checkboxes = List.generate(8, (index) => false);
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 80,
              child: Image.asset('assets/rdplogo.png'),
            ),
            const Text(
              'Daily Planner',
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 32,
             ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 78,
                color: Colors.white,
                child: TableCalendar(
                  calendarFormat: _calendarFormat,
                  headerVisible: false,
                  lastDay: DateTime(2030),
                  firstDay: DateTime(2023),
                  focusedDay: _focusDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = _selectedDay;
                      _focusDay = _focusDay;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: checkboxes[index] ? Colors.green.withOpacity(.7) : Colors.blue.withOpacity(.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(!checkboxes[index] ? Icons.manage_history : Icons.playlist_add_check_circle,
                          color:Colors.white,
                          size: 32,
                          ),
                          SizedBox(width: 18),
                          Text(
                            tasks[index]
                          ),
                        ],
                      ),
                    );
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}