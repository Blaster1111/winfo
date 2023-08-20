import 'package:flutter/material.dart';

import 'package:winfo/activities/contacts_cards.dart';
import 'package:winfo/home.dart';
// ignore: unused_import
import 'activities/contacts_display.dart';
// ignore: unused_import
import 'activities/loading.dart';
import 'activities/weather_home.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      // ignore: prefer_const_constructors
      "/home": (context) => WeatherHome(),
      // ignore: prefer_const_constructors
      "/": (context) => HomePage(),
      "/loading": (context) => Loading(),
      "/contacts_display": (context) => ContactDisplay(),
      "/contacts_cards": (context) => ContactsCards(
            name: '',
            number: '',
          ),
      "home_page": (context) => HomePage(),
    },
  ));
}
