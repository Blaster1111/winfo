import 'package:flutter/material.dart';
import 'package:winfo/activities/contacts_display.dart';
import 'package:winfo/activities/loading.dart';
import 'package:winfo/activities/login_details.dart';
import 'package:winfo/activities/weather_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    LoginDetails(),
    ContactDisplay(),
    Loading(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_sharp), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny_rounded), label: 'Weather')
          // Add more items as needed
        ],
      ),
    );
  }
}
