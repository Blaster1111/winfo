// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:winfo/WeatherWorker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String temp = '';
  String des = '';
  String air_speed = '';
  String hum = '';
  String main = '';
  String icon = '';
  String city = '';

  void startApp(String city) async {
    Worker instance = Worker(location: city);
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    des = instance.description;
    main = instance.main;
    air_speed = instance.air_speed;
    icon = instance.icon;
    city = instance.location;
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "temp_value": temp,
      "hum_value": hum,
      "description_value": des,
      "air_speed_value": air_speed,
      "main_value": main,
      "icon_value": icon,
      "city_value": city,
    });
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? nullablesearch = ModalRoute.of(context)?.settings.arguments as Map?;
    if (nullablesearch != null) {
      city = nullablesearch['searchText'];
    }

    startApp(city);
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Text('Please wait...'),
          ]),
    ));
  }
}
