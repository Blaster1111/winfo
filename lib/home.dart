import 'package:flutter/material.dart';
import 'package:winfo/activities/Profile.dart';
import 'package:winfo/activities/contacts_display.dart';
import 'package:winfo/activities/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    Profile(),
    ContactDisplay(),
    Loading(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade500,
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_sharp), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny_rounded), label: 'Weather'),
        ],
        selectedItemColor: Colors.black,
      ),
    );
  }
}
