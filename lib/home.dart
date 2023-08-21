import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/loading");
                  },
                  child: const Icon(Icons.wb_sunny_outlined),
                ),
                Text(
                  'Weather',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/contacts_display");
                  },
                  child: const Icon(Icons.person_search_sharp),
                ),
                Text(
                  'My Contacts',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "profile");
                  },
                  child: const Icon(Icons.person),
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Padding(padding: EdgeInsets.all(50)),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
