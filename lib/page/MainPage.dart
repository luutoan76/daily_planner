import 'package:daily_planner/page/TaskCalendar.dart';
import 'package:daily_planner/page/home.dart';
import 'package:daily_planner/page/settingPage.dart';
import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _currentIndex = 0;
  final List<Widget> page =[
    const TaskList(),
    const TaskCalendar(),
    const Settingpage(),
  ];

  final List<String> title =[
    "Công việc",
    "Lịch",
    "Cài đặt",
  ];
   void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[_currentIndex]),
        centerTitle: true,
        
      ),
      body: page[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0), // or 15.0 - 20.0
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Công việc',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Lịch',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Cài đặt',
              ),
              
            ],
            backgroundColor: const Color(0xFF152354),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            // icon select:
            selectedIconTheme: const IconThemeData(
              color: Colors.amber,
            ),
            // icon select:
            unselectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
          ),
        ),
      ),
    );
  }
}