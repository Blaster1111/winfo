import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winfo/activities/Profile.dart';
import 'package:winfo/activities/contacts_cards.dart';
import 'package:winfo/activities/login_details.dart';
import 'package:winfo/home.dart';
import 'activities/contacts_display.dart';
import 'activities/loading.dart';
import 'activities/weather_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Winfo',
      debugShowCheckedModeBanner: false,
      routes: {
        // ignore: prefer_const_constructors
        "/home": (context) => WeatherHome(),
        // ignore: prefer_const_constructors
        "/": (context) => SplashScreen(),
        "/home_page": (context) => HomePage(),
        "/loading": (context) => Loading(),
        "/contacts_display": (context) => ContactDisplay(),
        "/contacts_cards": (context) => ContactsCards(
              name: '',
              number: '',
            ),
        "/profile": (context) => Profile(),
        "/login_details": (context) => LoginDetails(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blueAccent,
          child: Center(
              child: Icon(
            Icons.flutter_dash,
            size: 150,
          ))),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginDetails()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginDetails()));
      }
    });
  }
}
