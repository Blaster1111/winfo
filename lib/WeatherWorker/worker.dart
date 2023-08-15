//In worker.dart data from api of openweather map is taken.

import 'dart:convert';
import 'package:http/http.dart';

class Worker {
  String location;

  Worker({required this.location});
  String temp = '';
  String humidity = '';
  String air_speed = '';
  String description = '';
  String main = '';
  String icon = '';

  //method
  //data is taken in a map then particular required data passed to suitable variable

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=aa7a3c13f8be3c0a0a3bd820afcf91d6"));
      Map data = jsonDecode(response.body);
      //getting  Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getmain_des = weather_main_data['main'];
      String getdesc = weather_main_data['description'];
      String get_icon = weather_main_data['icon'];

      //gettin temp,humidity
      Map temp_data = data['main'];
      String gethumidity = temp_data['humidity'].toString();
      double gettemp = temp_data['temp'] - 273.15; //C

      //gettin air speed
      Map wind = data['wind'];
      double getair_speed = wind['speed'] / 0.27777777777778; //Km/h

      //Assigning valuueee
      temp = gettemp.toString();
      humidity = gethumidity;
      air_speed = getair_speed.toString();
      description = getdesc;
      main = getmain_des;
      icon = get_icon.toString();
    } catch (e) {
      temp = "Can't Find Data!";
      humidity = "NA";
      air_speed = "Can't Find Data!";
      description = "Can't find data!";
      main = "Can't Find Data!";
      icon = "50n";
    }
  }
}
