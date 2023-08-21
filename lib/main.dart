import 'package:flutter/material.dart';
import 'package:winfo/activities/Profile.dart';
import 'package:winfo/activities/contacts_cards.dart';
import 'package:winfo/activities/login_details.dart';
import 'package:winfo/home.dart';
import 'activities/contacts_display.dart';
import 'activities/loading.dart';
import 'activities/weather_home.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      // ignore: prefer_const_constructors
      "/home": (context) => WeatherHome(),
      // ignore: prefer_const_constructors
      "/": (context) => LoginDetails(),
      "/home_page": (context) => HomePage(),
      "/loading": (context) => Loading(),
      "/contacts_display": (context) => ContactDisplay(),
      "/contacts_cards": (context) => ContactsCards(
            name: '',
            number: '',
          ),
      "profile": (context) => Profile(
            name: '',
            age: '',
            phoneNumber: '',
          ),
      "login_details": (context) => LoginDetails(),
    },
  ));
}
