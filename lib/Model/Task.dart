import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task{
  String? day;
  String? taskContent;
  String? time;
  String? location;
  String? host;
  String? note;
  Task({required this.day,required this.taskContent, required this.time, required this.location, required this.host, required this.note});

  Map<String, dynamic> toJson(){
    return {
      'day': day,
      'taskContent': taskContent,
      'time': time,
      'location':location,
      'host': host,
      'note': note
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      day: json['day'],
      taskContent: json['taskContent'],
      time: json['time'],
      location: json['location'],
      host: json['host'],
      note: json['note'],
    );
  }

}

class TaskProvider extends ChangeNotifier{
  final Map<DateTime, List<Task>> _tasks = {
    DateTime(2024, 9, 28): [
      Task(day: "28-09-2026", taskContent: "Meeting", time: "10:00 -> 11:00", location: "Room A", host: "Thanh Ngân", note: "Important meeting"),
    ],
    DateTime(2024, 9, 15): [
      Task(day: "15-09-2024", taskContent: "Workshop", time: "2:00 -> 5:00", location: "Hall B", host: "Hữu Nghĩa", note: "Technical workshop"),
      Task(day: "15-09-2024", taskContent: "Lam Do An", time: "7:00 -> 9:00", location: "Nha Rieng", host: "Hữu Nghĩa", note: "Do an ca nhan"),
    ],
    
  };

  Map<DateTime, List<Task>> get tasks => _tasks;

  List<Task> getTasksForDay(DateTime day) {
    DateTime normalizedDay = DateTime(day.year, day.month, day.day);
    return _tasks[normalizedDay] ?? [];
  }

  void addTask(Task task) {
    DateTime parsedDay = DateTime.parse(task.day!); 
    if (_tasks[parsedDay] == null) {
      _tasks[parsedDay] = [];
    }
    _tasks[parsedDay]!.add(task);
    notifyListeners();
  }


  void removeTask(DateTime day, Task task) {
    _tasks[day]?.remove(task);
    notifyListeners();
  }
}

class TaskStorage{
  Future<void> saveTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? taskList = prefs.getStringList('tasks');
    
    if (taskList == null) {
      taskList = [];
    }

    taskList.add(jsonEncode(task.toJson()));

    await prefs.setStringList('tasks', taskList);
    
    print("Task saved successfully!");
  }
  
    Future<List<Task>> getSavedTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList('tasks');

    if (taskList == null) {
      return [];
    }

    return taskList.map((taskJson) => Task.fromJson(jsonDecode(taskJson))).toList();
  }
  
  Future<void> removeTask() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('task');
  }


}