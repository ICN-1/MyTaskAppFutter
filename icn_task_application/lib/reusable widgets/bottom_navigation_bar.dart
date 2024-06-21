import 'package:flutter/material.dart';
import 'package:icn_task_application/other_pages/calendar.dart';
import 'package:icn_task_application/other_pages/home_page.dart';
import 'package:icn_task_application/other_pages/menu.dart';
import 'package:icn_task_application/other_pages/projects.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key, this.name}) : super(key: key);

  final String? name;

  @override
  _MyBottomNavigationBarState createState() =>
      _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar>{
  int _tabIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(name: widget.name),
      MyProjects(),
      MyCalendar(),
      MyMenu()
    ];
  }

  _changeTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_tabIndex],
      bottomNavigationBar: Container(
        height: 100,
        child: BottomNavigationBar(
          backgroundColor: Colors.grey[100],
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _tabIndex,
          onTap: (index) => _changeTab(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home'
            ),
        
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              label: 'Projects'
            ), 
        
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Calendar'
            ),
        
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu'
            )
          ],
          selectedItemColor: Colors.indigoAccent[400],
          unselectedItemColor: Colors.grey[700],
        ),
      ),
    );
  }
}  