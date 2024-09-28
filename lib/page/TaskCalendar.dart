import 'package:daily_planner/Model/Task.dart';
import 'package:daily_planner/page/detailPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class TaskCalendar extends StatefulWidget {
  const TaskCalendar({super.key});

  @override
  _TaskCalendarState createState() => _TaskCalendarState();
}

class _TaskCalendarState extends State<TaskCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();

    
  }


  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            eventLoader: (day) => taskProvider.getTasksForDay(day), 
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: const CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              )
            ),
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: _buildTaskList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    final taskProvider = Provider.of<TaskProvider>(context);
    List<Task> tasks = taskProvider.getTasksForDay(_selectedDay ?? _focusedDay);
    if (tasks.isEmpty) {
      return const Center(child: Text('Không có nhiệm vụ nào'));
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        Task task = tasks[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          elevation: 10,
          child: ListTile(
            title: Text(tasks[index].taskContent!),
            subtitle: Text("${tasks[index].time} at ${tasks[index].location}"),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Detailpage(task: task)));
            },
          ),
        );
      },
    );
  }
}
