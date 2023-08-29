// ignore: unused_import
import 'dart:convert';

import 'dart:math';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print('set state called');
  }

  @override
  void dispose() {
    super.dispose();
    print('Widget Destroyed');
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = new TextEditingController();
    var city_name = [
      "Mumbai",
      "Delhi",
      "Chennai",
      "Jaipur",
      "London",
      "Nashik",
      "Tamil Nadu",
      "California",
      "Pune"
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map info =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    String temp = ((info['temp_value']).toString().substring(0, 4));
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String humidity = ((info['hum_value']).toString().substring(0, 2));
    String air = ((info['air_speed_value']).toString().substring(0, 4));
    String description = info['description_value'];

    return Scaffold(
      //UI Starts
      appBar: AppBar(
        title: const Text(
          "Weather Forecast",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 2,
      ),
      body: SafeArea(

          //Container for whole screen
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(234, 101, 110, 238),
              Color.fromARGB(234, 114, 175, 232),
              Color.fromARGB(234, 131, 204, 244),
            ])),
        child: Column(
          children: [
            //Search box codee
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 196, 193, 193),
                  borderRadius: BorderRadius.circular(24)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if ((searchController.text).replaceAll(" ", "") == "") {
                        print('blank search');
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          "/loading",
                          arguments: {
                            "searchText": searchController.text,
                          },
                        );
                      }
                    },
                    child: Container(
                      child: Icon(Icons.search),
                      margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: 'Search $city', border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),

            //first box after search bar
            Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Image.network(
                          "http://openweathermap.org/img/wn/$icon@2x.png"),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "$description",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "In $getcity",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),

            //second big box in middle
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    padding: EdgeInsets.all(26),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.thermostat_sharp),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$temp',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'C',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),

            //two boxes in same line at the end
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    padding: EdgeInsets.all(26),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.wind_power_sharp),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '$air',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Km/hr',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    padding: EdgeInsets.all(26),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.water_drop_sharp),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$humidity',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '%',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/home_page");
                },
                child: Icon(Icons.arrow_back))
          ],
        ),
      )),
    );
  }
}
