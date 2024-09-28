import 'dart:convert';

import 'package:daily_planner/Model/Task.dart';
import 'package:daily_planner/Model/Theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> task = [];
  TaskStorage taskStorage = TaskStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadTasksFromSharedPreferences();
  }
  String _formatDayWithDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE, dd/MM/yyyy');
    return formatter.format(date);
  }

  Future<void> _loadTasksFromSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? taskList = prefs.getStringList('tasks');

  if (taskList != null) {
    setState(() {
      task = taskList.map((taskJson) => Task.fromJson(jsonDecode(taskJson))).toList();
    });
  }
}
  

  

  void popupForm(BuildContext context) {
    final taskContentController = TextEditingController();
    final locationController = TextEditingController();
    final notesController = TextEditingController();
    final timeController = TextEditingController();
    final dayController = TextEditingController();
    
    DateTime selectedDate = DateTime.now();
    dayController.text = _formatDayWithDate(selectedDate);
    List<String> hostList = ["Thanh Ngân", "Hữu Nghĩa"];
    String? selectedHost;
    TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 0, minute: 0);
    String selectedValue;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Thêm Công Việc Mới'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  readOnly: true,
                  controller: dayController,
                  decoration: const InputDecoration(
                    labelText: 'Thứ ngày',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null && pickedDate != selectedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                        dayController.text = _formatDayWithDate(selectedDate);
                      });
                    }
                  },
                ),
                TextField(
                  controller: taskContentController,
                  decoration: const InputDecoration(labelText: 'Nội dung công việc'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                      controller: timeController,
                      decoration: const InputDecoration(labelText: 'Thời gian', suffixIcon: Icon(Icons.access_alarm,)),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: startTime );
                        if(pickedTime != null){
                          startTime = pickedTime;
                          TimeOfDay? pickedEndTime = await showTimePicker(context: context, initialTime: endTime);
                          if(pickedEndTime != null){
                            endTime = pickedEndTime;
                            timeController.text = "${startTime.hour}:${startTime.minute} -> ${endTime.hour}:${endTime.minute}";
                          }
                        }
                    },
                    readOnly: true,
                    ),
                  ),
                  ],
                ),
                TextField(
                  controller: locationController,
                  decoration: const InputDecoration(labelText: 'Địa điểm'),
                ),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Chọn người chủ trì'),
                  value: selectedHost,
                  items: hostList.map((String host) {
                  return DropdownMenuItem<String>(
                    value: host,
                    child: Text(host),
                  );
                }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      selectedHost = newValue!;
                    });
                  },
                  validator: (value) => value == null ? "Vui lòng chọn" :null,
                ),
                
                TextField(
                  controller: notesController,
                  decoration: const InputDecoration(labelText: 'Ghi chú'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                Task taskData = Task(day: dayController.text, taskContent: taskContentController.text, time: timeController.text, location: locationController.text, host: selectedHost, note: notesController.text);
                setState(() {
                  task.add(taskData);
                });
                Navigator.of(context).pop(); 
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  void EditForm(BuildContext context, int index) {
    final taskContentController = TextEditingController(text: task[index].taskContent);
    final locationController = TextEditingController(text: task[index].location);
    final notesController = TextEditingController(text: task[index].note);
    final timeController = TextEditingController(text: task[index].time);
    final dayController = TextEditingController(text: task[index].day);
    
    DateTime selectedDate = DateTime.now();
    dayController.text = _formatDayWithDate(selectedDate);
    List<String> hostList = ["Thanh Ngân", "Hữu Nghĩa"];
    String? selectedHost = task[index].host;
    TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 0, minute: 0);
    String selectedValue;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Chỉnh Sửa Việc '),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  readOnly: true,
                  controller: dayController,
                  decoration: const InputDecoration(
                    labelText: 'Thứ ngày',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null && pickedDate != selectedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                        dayController.text = _formatDayWithDate(selectedDate);
                      });
                    }
                  },
                ),
                TextField(
                  controller: taskContentController,
                  decoration: const InputDecoration(labelText: 'Nội dung công việc'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                      controller: timeController,
                      decoration: const InputDecoration(labelText: 'Thời gian', suffixIcon: Icon(Icons.access_alarm,)),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: startTime );
                        if(pickedTime != null){
                          startTime = pickedTime;
                          TimeOfDay? pickedEndTime = await showTimePicker(context: context, initialTime: endTime);
                          if(pickedEndTime != null){
                            endTime = pickedEndTime;
                            timeController.text = "${startTime.hour}:${startTime.minute} -> ${endTime.hour}:${endTime.minute}";
                          }
                        }
                    },
                    readOnly: true,
                    ),
                  ),
                  ],
                ),
                TextField(
                  controller: locationController,
                  decoration: const InputDecoration(labelText: 'Địa điểm'),
                ),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Chọn người chủ trì'),
                  value: selectedHost,
                  items: hostList.map((String host) {
                  return DropdownMenuItem<String>(
                    value: host,
                    child: Text(host),
                  );
                }).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      selectedHost = newValue!;
                    });
                  },
                  validator: (value) => value == null ? "Vui lòng chọn" :null,
                ),
                
                TextField(
                  controller: notesController,
                  decoration: const InputDecoration(labelText: 'Ghi chú'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng popup
              },
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  task[index].taskContent = taskContentController.text;
                  task[index].day = dayController.text;
                  task[index].location = locationController.text;
                  task[index].note = notesController.text;
                  task[index].time = timeController.text;
                  task[index].host = selectedHost;
                });
                Navigator.of(context).pop(); // Đóng popup và lưu công việc
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }
    
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: SafeArea(
        child: ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(task[index].taskContent! , style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      subtitle: Text(
                        "${task[index].day}\nThời gian: ${task[index].time}\nĐịa điểm: ${task[index].location}\nChủ trì: ${task[index].host}\nGhi chú: ${task[index].note}",
                                             
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        color: Colors.blue,
                        onPressed: () => {
                          EditForm(context, index),
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => {
                          setState(() {
                            task.removeAt(index);
                          }),
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          popupForm(context);
        },
        tooltip: "Thêm công việc",
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    

      
    );
  }
  
}
  
